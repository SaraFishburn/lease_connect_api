class CreateJoinTableHousesUsers < ActiveRecord::Migration[6.1]
  def change
    create_join_table :houses, :users do |t|
      t.index %i[user_id house_id]
    end
  end
end
