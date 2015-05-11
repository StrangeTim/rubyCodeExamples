class AddListsTable < ActiveRecord::Migration
  def change
    create_table(:lists) do |t|
      t.column(:name, :string)
      t.column(:date, :string)

      t.timestamps()
    end
  end
end
