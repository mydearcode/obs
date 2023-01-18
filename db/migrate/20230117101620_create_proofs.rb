class CreateProofs < ActiveRecord::Migration[7.0]
  def change
    create_table :proofs do |t|
      t.references :review, null: false, foreign_key: true
      t.string :code
      t.boolean :verified, default: false

      t.timestamps
    end
  end
end
