class CreateSalars < ActiveRecord::Migration[7.1]
  def change
    create_table :salars do |t|
      t.string :salar_name
      t.string :product_name
      t.string :city
      t.belongs_to :user

      t.timestamps
    end
  end
end
