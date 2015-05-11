class List < ActiveRecord::Base
  has_many(:tasks)
  define_singleton_method(:this_list) do |id|
    returned_lists = List.all
    lists = nil
    returned_lists.each() do |list|
      name = list.name
      date = list.date
      id2 = list.id
      if id2 == id
        lists = (List.new({:name => name, :date => date, :id => id}))
      end
    end
    lists
  end
end
