class AddProofColumnsToReviews < ActiveRecord::Migration[7.0]
  def change
    add_column :reviews, :have_proof, :boolean, default: false
    add_column :reviews, :verified, :boolean, default: false
    add_column :reviews, :invited, :boolean, default: false
  end
end
