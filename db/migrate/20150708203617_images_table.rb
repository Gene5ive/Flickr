class ImagesTable < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.column :image_caption, :string
      t.column :user_id, :integer

      t.timestamps
    end
  end
end
