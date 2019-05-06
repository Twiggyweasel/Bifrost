class Admin::UsersController < ApplicationController
    layout 'admin'
    before_action :set_user, only: [:show, :edit, :update, :new]
    
    def index
        @users = User.all
    end
    
    def show
    end
    
    def new
    end
    
    def create
    end
    
    def edit
    end
    
    def update
    end
    
    def destroy
    end

    private
        def user_params
            Params.require(:user).permit(:first_name, :last_name, :email, :primary_phone, :secondary_phone, :client)
        end
        
        def set_user
            @user = User.find(params[:id])
        end
end
