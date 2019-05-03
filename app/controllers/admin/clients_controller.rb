class Admin::ClientsController < ApplicationController
    def index
        @clients = Client.all
    end
    
    def show
        @client = Client.find(params[:id])
    end
    
    def new
        @client = Client.new
    end
    
    def create
        @client = Client.new(client_params)
        
        if @client.save 
            redirect_to @client
        else
            render :new
        end
    end 
    
    def edit
        @client = Client.find(params[:id])
    end
    
    def update
        @client = Client.find(params[:id])
        if @client.udpate(client_params)
            redirect_to @client
        else
            render :edit
        end
    end
    
    def destroy
        @client = Client.find(params[:id])
        @client.delete
        
        redirect_to admin_clients_path
    end
    
    private
        def client_params
            params.require(:client).permit(:name, :status, :service_type, :payment_method, :onboard_date, :offboard_date, :recent_request_date, :account_current, :street, :city, :state, :zipcode)
        end
end