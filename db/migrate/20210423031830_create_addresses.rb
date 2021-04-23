class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.integer     :area_id,  null: false
      t.string      :postal_code, null: false
      t.string      :municipality, null: false
      t.string      :house_num, null: false
      t.string      :tel, null: false
      t.string      :building
      t.timestamps
    end
  end
end
