class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.string :title
      t.text :info
      t.string :of_link
      t.string :buy_link
      t.integer :category_id
      t.belongs_to :brand, null: false, foreign_key: true
      t.integer :user_id

      t.timestamps
    end
  end
end
