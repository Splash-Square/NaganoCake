class CreateGenrus < ActiveRecord::Migration[6.1]
  def change
    create_table :genrus do |t|
      t.string :item_genre, null: false
      
      t.timestamps
    end
  end
end
