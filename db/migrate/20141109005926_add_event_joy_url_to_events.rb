class AddEventJoyUrlToEvents < ActiveRecord::Migration
  def change
    add_column :events, :event_page_url, :string
  end
end
