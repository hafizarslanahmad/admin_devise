class BuyersController < ApplicationController
    def new 
        @buyer = Buyer.new 
        @buyer.build_salar
    end 

    def index 
        @buyers = Buyer.all 
    end

    def show
        if current_user.salar?
         @buyer = Buyer.find(params[:id])
        else
            redirect_to root_path, alert: "User Salar  could be must"
        end 
    end

    def create 
        @buyer = Buyer.new(buyer_params)
        if @buyer.save
            redirect_to buyers_path
        end
    end
    def edit
        @buyer = Buyer.find(params[:id])
    end

    def update
        @buyer = Buyer.find(params[:id])
        @buyer.update(buyer_params)
        redirect_to root_path
    end 

    def destroy
        @buyer = Buyer.find(params[:id])
        @buyer.destroy
        redirect_to buyers_path
    end
    
    private

    def buyer_params
        params.require(:buyer).permit(:name, :city, :salar_id)
    end
end
