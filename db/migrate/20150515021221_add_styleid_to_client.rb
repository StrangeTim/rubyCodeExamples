class AddStyleidToClient < ActiveRecord::Migration
  def change
    add_column(:clients, :stylist_id, :int)
  end
end
