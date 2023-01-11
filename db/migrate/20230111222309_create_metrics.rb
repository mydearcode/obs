class CreateMetrics < ActiveRecord::Migration[7.0]
  def change
    create_table :metrics do |t|
      t.string :title
      t.belongs_to :category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
