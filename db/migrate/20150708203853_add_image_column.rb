class AddImageColumn < ActiveRecord::Migration
  def change
    add_attachment :images, :attached_image
  end
end
