class AddRateColumnsToProducts < ActiveRecord::Migration[7.0]
  def change
    add_column :products, :metric_1, :string
    add_column :products, :metric_2, :string
    add_column :products, :metric_3, :string
    add_column :products, :metric_4, :string
    add_column :products, :rate_1, :float
    add_column :products, :rate_2, :float
    add_column :products, :rate_3, :float
    add_column :products, :rate_4, :float
  end
end
