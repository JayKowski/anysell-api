class CreateProductFeatures < ActiveRecord::Migration[7.0]
  def change
    create_table :product_features do |t|
      t.string :feature_name
      t.string :feature_value

      t.timestamps
    end
  end
end
