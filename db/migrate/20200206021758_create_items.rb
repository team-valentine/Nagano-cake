class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|

      t.integer :genre_id
      t.string :name
      t.text :description
      t.integer :tax_excluded_price
      t.string :imane_id
      t.integer :status
      t.timestamps
    end
  end
end
