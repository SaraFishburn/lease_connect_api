class CreateHouses < ActiveRecord::Migration[6.1]
  def change
    create_table :houses do |t|
      t.string :address
      t.string :title
      t.string :image_url

      t.timestamps
    end
  end
end
