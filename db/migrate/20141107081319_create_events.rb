class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.string :venue
      t.string :city
      t.text :description

      t.timestamps
    end
  end
end
