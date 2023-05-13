class AddUserReferenceToPictures < ActiveRecord::Migration[7.0]
  def change
    add_reference :pictures, :user, null: false, foreign_key: true
  end
end
