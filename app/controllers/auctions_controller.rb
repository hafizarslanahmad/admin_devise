class AuctionsController < ApplicationController
    def new 
        if current_user.admin?
          @auction = Auction.new
        else
            redirect_to root_path, alert: "User Admin  could be must"
        end 
    end 

    def index 
        @auctions = Auction.all 
    end

    def show
        @auction = Auction.find(params[:id])
    end

    def create 
        if current_user.admin?
            @auction = Auction.new(auction_params)
            if @auction.save
                redirect_to auctions_path
            end
        end
    end
    def edit
        @auction = Auction.find(params[:id])
    end

    def update
        @auction = Auction.find(params[:id])
        @auction.update(auction_params)
        redirect_to root_path
    end 

    def destroy 
        @auction = Auction.find(params[:id])
        @auction.destroy 
        redirect_to root_path

    end
    
    private

    def auction_params
        params.require(:auction).permit(:product_name, :user_id)
    end
end
