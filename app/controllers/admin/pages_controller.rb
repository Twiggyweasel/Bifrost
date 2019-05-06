class Admin::PagesController < ApplicationController
    layout 'admin'
    def dashboard
        @tickets = Ticket.active
    end
    
    def tickets
        @tickets = Ticket.includes(:client).all
    end
end