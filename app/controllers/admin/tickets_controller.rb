class Admin::TicketsController < ApplicationController
    layout 'admin'
    before_action :set_ticket, only: [:show]
    def index
#        @tickets = Ticket.includes(:client).all
        @q = Ticket.ransack(params[:q])
        @tickets = @q.result.includes(:client, :user).page(params[:page])
        
        respond_to do |f|
            f.js { render 'index.js.erb' }
            f.html
        end
    end
    def show; end
  
    def new
        @ticket = Ticket.new
    end
    
    def create
        @ticket = Ticket.create(ticket_params)
        if @ticket.save
            redirect_to admin_ticket_path(@ticket)
        else
            render :new
        end
    end
    
    def edit; end
    
    def update 
        if @ticket.update(ticket_params)
            redirect_to admin_ticket_path(@ticket)
        else
            render :edit
        end
    end
    
    def destroy
        @ticket.destroy
        redirect_to admin_client_path(@ticket.client)
    end
    
    private
        def ticket_params
            params.require(:ticket).permit(:ticket_number, :request_summary, :request_detail, :outcome_summary, :outcome_detail, :due, :resolved, :last_response, :severity, :status, :client_id, :user_id)
        end
        
        def set_ticket
            @ticket = Ticket.find(params[:id])
        end
end
