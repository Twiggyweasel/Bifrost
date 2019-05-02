class Client < ApplicationRecord
    enum status: [ :active, :inactive, :potential ]
    
end
