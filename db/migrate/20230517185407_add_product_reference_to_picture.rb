class AddProductReferenceToPicture < ActiveRecord::Migration[7.0]
  def change
    add_reference :pictures, :products, foreign_key: true
  end
end
