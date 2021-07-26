class CreateEvents < ActiveRecord::Migration[6.1]
  def change
    create_table :events do |t|
      t.datetime :datetime
      t.string :event_type
      t.references :house
      t.references :maintenance

      t.timestamps
    end
  end
end
