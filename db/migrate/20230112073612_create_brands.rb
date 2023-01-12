class CreateBrands < ActiveRecord::Migration[7.0]
  def change
    create_table :brands do |t|
      t.string :title
      t.text :info
      t.string :of_link
      t.integer :category_id
      t.integer :parent_id

      t.timestamps
    end
  end
end
