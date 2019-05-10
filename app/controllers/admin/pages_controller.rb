class Admin::PagesController < ApplicationController
    layout 'admin'
    def dashboard
        @tickets = Ticket.active
    end

end