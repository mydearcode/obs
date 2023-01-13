class CreateReviewResponses < ActiveRecord::Migration[7.0]
  def change
    create_table :review_responses do |t|
      t.integer :rate
      t.string :metric
      t.references :review, null: false, foreign_key: true

      t.timestamps
    end
  end
end
