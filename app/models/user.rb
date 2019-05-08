class User < ApplicationRecord
  belongs_to :client
  has_many :tickets
    def full_name
        "#{first_name} #{last_name}"
    end
end
