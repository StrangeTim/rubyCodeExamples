class AddInitialTables < ActiveRecord::Migration
  def change
    create_table(:bands) do |t|
      t.column(:band_name, :string)
      t.column(:band_genre, :string)
    end
    create_table(:venues) do |t|
      t.column(:venue_name, :string)
      t.column(:venue_location, :string)
    end
  end
end
