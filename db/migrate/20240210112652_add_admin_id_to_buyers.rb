class AddAdminIdToBuyers < ActiveRecord::Migration[7.1]
  def change
    add_column :buyers, :admin_id, :string
  end
end
