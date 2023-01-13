class AddTotalRateColumnToReviews < ActiveRecord::Migration[7.0]
  def change
    add_column :reviews, :total_rate, :float, default: 0.0
    add_index :reviews, :total_rate
  end
end
