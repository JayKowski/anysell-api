class CreateProductsFeatures < ActiveRecord::Migration[7.0]
  def change
    create_table :products_features do |t|
      t.references :product_feature, null: false, foreign_key: true
      t.references :product, null: false, foreign_key: true

      t.timestamps
    end
  end
end
