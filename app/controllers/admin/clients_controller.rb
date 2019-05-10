class Admin::ClientsController < ApplicationController
    layout 'admin' 
    def index
        @q = Client.ransack(params[:q])
        @clients = @q.result.includes(:primary_contact).page(params[:page])
        @tickets = Ticket.active.limit(3).load
    end
    
    def show
        @client = Client.includes([tickets: :user], :primary_contact).find(params[:id])
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