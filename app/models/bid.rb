class Bid < ActiveRecord::Base

  validates :amount, presence: true, numericality: true

  scope :ordered_by_amount, -> {order("amount DESC")}

end
