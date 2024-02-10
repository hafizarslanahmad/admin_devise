class AddAdminIdToSalars < ActiveRecord::Migration[7.1]
  def change
    add_column :salars, :admin_id, :string
  end
end
