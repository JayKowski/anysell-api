class CreatePictures < ActiveRecord::Migration[7.0]
  def change
    create_table :pictures do |t|
      t.text :link_url
      t.text :caption

      t.timestamps
    end
  end
end
