class CreateReports < ActiveRecord::Migration[7.0]
  def change
    create_table :reports do |t|
      t.text :body
      t.integer :subject, null: false, default: 1
      t.references :reportable, polymorphic: true, null: false
      t.integer :user_id, null: false

      t.timestamps
    end
    add_index :reports, [:reportable_type, :reportable_id]
  end
end
