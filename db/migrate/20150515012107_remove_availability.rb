class RemoveAvailability < ActiveRecord::Migration
  def change
    drop_table(:availability)
    add_column(:stylists, :avail_mon, :string)
    add_column(:stylists, :avail_tue, :string)
    add_column(:stylists, :avail_wed, :string)
    add_column(:stylists, :avail_thu, :string)
    add_column(:stylists, :avail_fri, :string)
    add_column(:stylists, :avail_sat, :string)
    add_column(:stylists, :avail_sun, :string)
  end
end
