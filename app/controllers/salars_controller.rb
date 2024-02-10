class SalarsController < ApplicationController
    def new 
        if current_user.admin?
            @salar = Salar.new 
            @salar.buyers.build
        else
            redirect_to root_path, alert: "User Admin  could be must"
        end 
    end 

    def index 
        @salars = Salar.all 
    end


    def show
        @salar = Salar.find(params[:id])
        @buyer = @salar.buyers.build
    end


    def create 
        if current_user.admin?
            @salar = Salar.new(salar_params)
            pass = SecureRandom.hex 3
            @user = User.create(email: @salar.salar_name + '@gmail.com', password: pass, role: 'salar')  
            @salar.user_id=@user.id 
            if @salar.save
                UserMailer.salar_email(@user, pass).deliver_now
 
            end
            redirect_to salars_path
        end
    end
    def edit
        @salar = Salar.find(params[:id])
    end

    def update
        @salar = Salar.find(params[:id])
        @salar.update(salar_params)
        redirect_to root_path
    end 

    def destroy
        @salar = Salar.find(params[:id])
        @salar.destroy
        redirect_to salars_path
    end
    
    private

    def salar_params
        params.require(:salar).permit(:salar_name, :product_name, :city, :user_id)
    end
end
