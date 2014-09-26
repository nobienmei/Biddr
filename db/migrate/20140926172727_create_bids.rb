class CreateBids < ActiveRecord::Migration
  def change
    create_table :bids do |t|
      t.integer :amount
      t.boolean :win_bid
      t.references :auction, index: true

      t.timestamps
    end
  end
end
