class CreateReviews < ActiveRecord::Migration[7.0]
  def change
    create_table :reviews do |t|
      t.integer :category_id
      t.belongs_to :product, null: false, foreign_key: true
      t.integer :user_id

      t.timestamps
    end
  end
end
