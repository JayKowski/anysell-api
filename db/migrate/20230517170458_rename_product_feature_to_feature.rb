class RenameProductFeatureToFeature < ActiveRecord::Migration[7.0]
  def change
    rename_table :product_features, :features
  end
end
