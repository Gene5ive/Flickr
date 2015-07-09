class EditTable < ActiveRecord::Migration
  def change
    rename_table :tags_tables, :tags
  end
end
