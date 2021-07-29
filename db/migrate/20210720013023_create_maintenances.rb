class CreateMaintenances < ActiveRecord::Migration[6.1]
  def change
    create_table :maintenances do |t|
      t.string :title
      t.string :description
      t.string :image_url
      t.references :house, null: false, foreign_key: true

      t.timestamps
    end
  end
end
