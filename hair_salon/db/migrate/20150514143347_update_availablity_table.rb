class UpdateAvailablityTable < ActiveRecord::Migration
  def change
    drop_table(:availabilty)

    create_table(:availability) do |t|
      t.belongs_to :stylist, index: true
      t.string :monday
      t.string :tuesday
      t.string :wednesday
      t.string :thursday
      t.string :friday
      t.string :saturday
      t.string :sunday
    end
  end
end
