class CreatePhotoProofs < ActiveRecord::Migration[7.0]
  def change
    create_table :photo_proofs do |t|
      t.jsonb :image_data
      t.references :review, null: false, foreign_key: true

      t.timestamps
    end
  end
end
