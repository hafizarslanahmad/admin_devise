class RemoveAdminIdToBuyers < ActiveRecord::Migration[7.1]
  def change
    remove_column :buyers, :admin_id
  end
end
