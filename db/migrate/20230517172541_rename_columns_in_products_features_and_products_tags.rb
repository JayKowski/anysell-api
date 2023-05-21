class RenameColumnsInProductsFeaturesAndProductsTags < ActiveRecord::Migration[7.0]
  def change
    rename_column :products_features, :product_feature_id, :feature_id
    rename_column :products_tags, :product_tag_id, :tag_id
  end
end
