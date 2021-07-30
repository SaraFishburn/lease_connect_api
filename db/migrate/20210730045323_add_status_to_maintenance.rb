class AddStatusToMaintenance < ActiveRecord::Migration[6.1]
  def change
    add_column :maintenances, :status, :string
  end
end
