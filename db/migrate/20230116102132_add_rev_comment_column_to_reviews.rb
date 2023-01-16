class AddRevCommentColumnToReviews < ActiveRecord::Migration[7.0]
  def change
    add_column :reviews, :rev_comment, :text
  end
end
