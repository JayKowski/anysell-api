class RenameProductTagToTag < ActiveRecord::Migration[7.0]
  def change
    rename_table :product_tags, :tags
  end
end
