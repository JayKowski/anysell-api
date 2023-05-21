class RemoveUserReferenceFromPicture < ActiveRecord::Migration[7.0]
  def change
    remove_reference :pictures, :user, foreign_key: true 
  end
end
