class To_Do

  attr_reader(:task, :list_id)

  define_method(:initialize) do |inputs|
    @list_id = inputs.fetch(:list_id)
    @task = inputs.fetch(:task)
  end

  define_singleton_method(:all) do
    returned_tasks = DB.exec("SELECT * FROM tasks;")
    tasks = []
    returned_tasks.each() do |task|
      description = task.fetch("description")
      list_id = task.fetch("list_id").to_i
      tasks.push(To_Do.new({:task => description, :list_id => list_id}))
    end
    tasks
  end

  define_method(:add) do
     DB.exec("INSERT INTO tasks (description, list_id) VALUES ('#{@task}', '#{@list_id}');")
  end

  define_method(:description) do
    @task
  end

  define_method(:==) do |another_task|
    self.description == another_task.description
  end

  define_singleton_method(:list_tasks) do |id|
    all_tasks = To_Do.all()
    list_tasks = []
    all_tasks.each() do |ind_task|
      if ind_task.list_id() == id
        list_tasks.push(ind_task)
      end
    end
    list_tasks
  end

end
