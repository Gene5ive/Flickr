class CommentsTable < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.column :comment_text, :string
      t.column :user_id, :integer
      t.column :image_id, :integer

      t.timestamps
    end
  end
end
