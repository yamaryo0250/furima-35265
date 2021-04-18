class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :product
      t.integer :genre_id
      t.text :text
      t.integer :condition_id
      t.integer :price
      t.integer :charge_id
      t.integer :area_id
      t.integer :day_id
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
