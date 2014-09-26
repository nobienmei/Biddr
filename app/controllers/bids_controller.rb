class BidsController < ApplicationController
  before_action :find_auction

  def create
    @bid = @auction.bids.new(bid_params)

    respond_to do |format| 
      if check_price && @bid.save
        format.html {redirect_to @auction, notice: "Bid created successfully!!" }
        format.js { render }
      else
        format.js { render :error}
        format.html {redirect_to @auction, notice: "The minimum bid must be higher than $#{@auction.reserve_price}" } 
      end
    end

  end

  def update
    @bid = bid.find(params[:id])
    if @bid.update_attributes(bid_params)
      render json: {status: "success"}
    else
      render json: {status: "failure"}
    end
  end

  private

  def bid_params
    params.require(:bid).permit([:amount])
  end

  def find_auction
    @auction = Auction.find(params[:auction_id])
  end

 def check_bid_amounts
  @bid.amounts.to_i > @auction.reserve_price.to_i
 end

 def check_price
  @bid.amount.to_i > @auction.reserve_price.to_i
 end

end
