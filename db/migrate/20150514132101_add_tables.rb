class AddTables < ActiveRecord::Migration
  def change
    create_table(:stylists) do |t|
      t.column(:style_name, :string)
    end
    create_table(:clients) do |t|
      t.column(:client_name, :string)
    end
    create_table(:availabilty) do |t|
      t.column(:monday, :string)
      t.column(:tuesday, :string)
      t.column(:wednesday, :string)
      t.column(:thursday, :string)
      t.column(:friday, :string)
      t.column(:saturday, :string)
      t.column(:sunday, :string)
    end
    create_table(:appointments) do |t|
      t.column(:stylist_id, :int)
      t.column(:client_id, :int)
      t.column(:app_day, :string)
      t.column(:app_time, :string)
      t.timestamps()
    end
  end
end
