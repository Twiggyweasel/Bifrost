class Client < ApplicationRecord
#Defaults
    enum status: [ :active, :inactive, :potential ]
    enum service_type: [ :contract, :billable, :pending]
    enum payment_method: [ :credit_card, :cash, :check, :undefined]
    paginates_per weasel10
#Relationships
    has_many :tickets
    has_many :users
    has_one :primary_contact, -> { where(is_primary: true) }, class_name: "User"
    
#Validations
    validates :name, presence: true, length: { in: 3..60 }
    validates :status, presence: true
    validates :service_type, presence: true
    validates :payment_method, presence: true
    validates :street, presence: true, length: { in: 6.. 40 }
    validates :city, presence: true, length: { in: 3..25 }
    validates :state, presence: true, length: { is: 2 }
    validates :zipcode, presence: true, numericality: true


#Methods
    def active_ticket_count
        tickets.active.count
    end
end
