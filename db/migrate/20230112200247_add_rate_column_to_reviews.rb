class AddRateColumnToReviews < ActiveRecord::Migration[7.0]
  def change
    add_column :reviews, :rate, :integer, null: false
  end
end
