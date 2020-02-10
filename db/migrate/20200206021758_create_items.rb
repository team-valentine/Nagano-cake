class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|

      t.integer :genre_id
      t.string :name
      t.text :description
      t.integer :tax_excluded_price
      t.string :image_id
      t.integer :status, default: 1, null: false, limit: 1
      t.timestamps
    end
  end
end
