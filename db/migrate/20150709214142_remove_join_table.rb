class RemoveJoinTable < ActiveRecord::Migration
  def change
    drop_join_table :images, :users
  end
end
