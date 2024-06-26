class CreateItems < ActiveRecord::Migration[7.0]
  def change
    create_table :items do |t|
      t.references :user, null:false, foreign_key:true
      t.string :item_name, null: false
      t.text :item_info, null: false
      t.integer :category_id, null:false
      t.integer :item_condition_id, null:false
      t.integer :prefecture_id, null:false
      t.integer :shipping_period_id, null:false
      t.integer :postage_payer_id, null:false
      t.integer :item_price, null:false
      t.timestamps
    end
  end
end
