class CreatePurchases < ActiveRecord::Migration
  def change
    create_table :purchases do |t|
      t.boolean :show

      t.timestamps
    end
  end
end
