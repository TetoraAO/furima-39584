class CreateItems < ActiveRecord::Migration[7.0]
  def change
    create_table :items do |t|
      t.string :name,                null: false
      t.text :explanation,           null: false
      t.integer :category_id,        null: false
      t.integer :condition_id,       null: false
      t.integer :delivery_charge_id, null: false
      t.integer :region_id,      null: false
      t.integer :delivery_date_id,   null: false
      t.integer :price,              null: false
      t.references :user,      foreign_key: true
      t.timestamps
    end
  end
end
