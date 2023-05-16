class CreateItems < ActiveRecord::Migration[6.1]
  def change
    create_table :items do |t|
      t.integer  :genre_id,         null: false
      t.text     :item_description, null: false
      t.integer  :price,            null: false
      t.string   :item_name,        null: false
      t.boolean  :is_selling,       null: false, default: true

      t.timestamps
    end
  end
end