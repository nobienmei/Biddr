class CreateAuctions < ActiveRecord::Migration
  def change
    create_table :auctions do |t|
      t.string :title
      t.text :details
      t.datetime :end_date
      t.integer :reserve_price
      t.boolean :status
      t.timestamps
    end
  end
end
