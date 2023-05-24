class ChangeRefNumToUseUuid < ActiveRecord::Migration[7.0]
  def change
    remove_column :orders, :ref_number
  end
end
