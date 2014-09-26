class AuctionsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create,:edit]
  before_action :find_auction, only: [:edit, :show, :update, :destroy]

  def index
    @auctions = Auction.all
  end

  # def index
  #   @auctions = Auction.published.paginate(page: params[:page], per_page: 20).order("created_at DESC")
  #   respond_to do |format|
  #     format.html { render :index }
  #     format.js   { render :index }
  #   end
  # end
  
  def new
    @auction = Auction.new
  end



  def create
    #@auction = current_user.auctions.new auction_params
     @auction = Auction.new(auction_params)
    if @auction.save
      redirect_to @auction, notice: "auction created!"
    else
      render :new
    end
  end

  def edit
  end

  def show
    @auction = Auction.find(params[:id])
    @bids = @auction.bids.ordered_by_amount
  end

  def update
    if @auction.update_attributes(auction_params)
      redirect_to @auction, notice: "updated the auction!"
    else
      render :edit
    end
  end

  def destroy
    if @auction.destroy
      redirect_to root_path, notice: "Auction deleted"
    else
      redirect_to root_path, error: "Auction can't be deleted"
    end
  end

  private

  def auction_params
    params.require(:auction).permit(:title, :details, :reserve_price, :end_date)
  end


  def find_auction
    @auction = Auction.find(params[:id])
  end


end
