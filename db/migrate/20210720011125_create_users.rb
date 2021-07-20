class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :password_digest
      t.string :phone_number
      t.string :role_name
      t.references :house, foreign_key: true

      t.timestamps
    end
  end
end
