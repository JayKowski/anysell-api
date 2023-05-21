class RenameProductReferenceColumnInPictures < ActiveRecord::Migration[7.0]
  def change
    rename_column :pictures, :products_id, :product_id
  end
end
