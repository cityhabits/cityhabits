class AddEventOpenToEvents < ActiveRecord::Migration
  def change
    add_column :events, :event_open, :boolean
  end
end
