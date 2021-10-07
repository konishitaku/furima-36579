class CreateResidences < ActiveRecord::Migration[6.0]
  def change
    create_table :residences do |t|
      t.string :postal_code  ,null: false
      t.integer :area_id  ,null: false
      t.string :town  ,null: false
      t.string :address  ,null: false
      t.string :building
      t.string :telephone_number  ,null: false
      t.references :order      , null: false, foreign_key: true
      t.timestamps
    end
  end
end
