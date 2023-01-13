class RemoveMetricColumnFromReviews < ActiveRecord::Migration[7.0]
  def change
    remove_column :reviews, :metric
    remove_column :reviews, :rate
  end
end
