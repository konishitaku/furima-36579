class CreateResidences < ActiveRecord::Migration[6.0]
  def change
    create_table :residences do |t|
      t.integer :postal_code  ,null: false
      t.integer :area_id  ,null: false
      t.integer :town  ,null: false
      t.integer :address  ,null: false
      t.integer :building
      t.string :telephone_number  ,null: false
      t.references :order      , null: false, foreign_key: true
      t.timestamps
    end
  end
end
