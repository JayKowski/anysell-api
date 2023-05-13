class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :username
      t.string :password
      t.text :location
      t.string :user_type
      t.string :mobile_number
      t.string :email_address
      t.text :about

      t.timestamps
    end
  end
end
