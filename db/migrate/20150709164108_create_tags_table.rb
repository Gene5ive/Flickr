class CreateTagsTable < ActiveRecord::Migration
  def change
    create_table :tags_tables do |t|
      t.column :tag_label, :string
      t.column :image_id, :string

      t.timestamps
    end
  end
end
