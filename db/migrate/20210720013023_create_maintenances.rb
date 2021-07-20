class CreateMaintenances < ActiveRecord::Migration[6.1]
  def change
    create_table :maintenances do |t|
      t.string :description
      t.references :house, null: false, foreign_key: true
      t.references :event, null: false, foreign_key: true

      t.timestamps
    end
  end
end
