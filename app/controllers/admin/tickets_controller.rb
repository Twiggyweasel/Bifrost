class Admin::TicketsController < ApplicationController
    layout: 'admin'
  def show
    @ticket = Ticket.find(params[:id])
  end
end
