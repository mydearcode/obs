class AddMetricColumnToReviews < ActiveRecord::Migration[7.0]
  def change
    add_column :reviews, :metric, :string, null: false
  end
end
