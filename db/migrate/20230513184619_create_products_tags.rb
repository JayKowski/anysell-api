class CreateProductsTags < ActiveRecord::Migration[7.0]
  def change
    create_table :products_tags do |t|
      t.references :product_tag, null: false, foreign_key: true
      t.references :product, null: false, foreign_key: true

      t.timestamps
    end
  end
end
