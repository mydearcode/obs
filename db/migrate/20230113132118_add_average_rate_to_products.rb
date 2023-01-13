class AddAverageRateToProducts < ActiveRecord::Migration[7.0]
  def change
    add_column :products, :average_rate, :float, default: 0.0
  end
end
