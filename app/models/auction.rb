class Auction < ActiveRecord::Base

  has_many :bids, dependent: :destroy

  validates :title, presence: true
  validates :reserve_price, presence: true

  def current_price

      self.bids.ordered_by_amount.first.amount 
  end


  # scope :published, -> { where(state: :published) }

  # state_machine :state, initial: :draft do

  #   event :publish do
  #     transition draft: :published
  #   end

  #   event :complete do
  #     transition published: :target_met
  #   end

  #   event :expire do
  #     transition target_met: :succeeded, published: :failed
  #   end

  #   event :cancel do
  #     transition [:draft, :published, :target_met] => :canceled
  #   end

  #   after_transition on: :canceled, do: :refund_all_bids
  # end

  # def refund_all_bids
  #   # code to schedule bg task to refund all
  # end


end
