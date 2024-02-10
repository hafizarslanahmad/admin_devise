class CreateAuctions < ActiveRecord::Migration[7.1]
  def change
    create_table :auctions do |t|
      t.string :product_name
      t.belongs_to :user

      t.timestamps
    end
  end
end
