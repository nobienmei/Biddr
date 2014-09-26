require 'rails_helper'

RSpec.describe AuctionsController, :type => :controller do

  let(:auction) { create(:auction) }

  describe "#index" do

    it "assigns auctions a variable @auction" do
      get :index
      expect(assigns(:auctions)).to be  
    end

    it "renders index template" do
      get :index
    expect(response).to render_template(:index)
    end
  end

  describe "#new" do
    # before { get: new }
    # specify { assigns(:auction).should be }
    # it      { expect(response).to render_template(:new) }

    it "assigns a new auction instance var" do
      get :new  
      expect(assigns(:auction)).to be_a_new(Auction) # ..to be(true)
    end
  end

  describe "#create" do

    context "with valid params" do
      def valid_request
        post :create, auction: {title: "some valid title", 
                                details: "valid details",
                                reserve_price: 50 }
      end

      it "creates an auction record in the database" do
        expect { valid_request }.to change {Auction.count}.by(1)
      end

      it "redirects to auction show page" do
        valid_request
        expect(response).to redirect_to(Auction.last)
      end

    end


    context "with invalid params" do
      def invalid_request
        post :create, auction: {title: "", details: "valid details"}
      end

      it "doens't create a record in the database" do
        expect { invalid_request }.to_not change { Auction.count }
      end

      it "renders new template" do
        invalid_request
        expect(response).to render_template(:new)
      end

    end
  end

  describe "#edit" do

    it "assigns an instance variable with auction whose id is passed" do
      get :edit, id: auction.id
      expect(assigns(:auction)).to eq(auction)
    end
  end

  describe "#show" do

    it "assigns an instance variable with auction whose id is passed" do
      get :show, id: auction.id
      expect(assigns(:auction)).to eq(auction)
    end
  end

  describe "#update" do

    context "with valid params" do
      def valid_request
        patch :update, id: auction.id, auction: {title: "Some new title",
                                                details: "Some new details",
                                                reserve_price: 300  }
      end

      it "changes title to the new passed title" do
        valid_request
        auction.reload
        expect(auction.title).to eq("Some new title")
      end

      it "redirect to auction show page" do
        valid_request
        expect(response).to redirect_to(auction)
      end
    end

    context "with invalid params" do
      def invalid_request
        patch :update, id: auction.id, auction: {title: ""}
      end

      it "doesn't change the title" do
        # expect do
        #   invalid_request
        # end.to_not change { auction.reload.title }
        old_title = auction.title
        invalid_request
        auction.reload
        expect(auction.title).to eq(old_title)
      end

      it "renders edit template" do
        invalid_request
        expect(response).to render_template(:edit)
      end
    end
  end

  describe "#destroy" do
    before { auction }
    it "removes the auction from the database" do
      expect { delete :destroy, id: auction.id }.to change {Auction.count}.by(-1)
    end


    it "redirects to auction home page" do
      delete :destroy, id: auction.id
      expect(response).to redirect_to(root_path)
    end

  end



end
