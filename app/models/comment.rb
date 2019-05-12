class Comment < ApplicationRecord
    default_scope { order(created_at: :desc) }
    
    belongs_to :commentable, polymorphic: true
    belongs_to :user

    validates :body, presence: true, length:  :within [15..500] 

    after_save :touch_commentable
    
    def touch_commentable
        self.commentable.touch(:last_response)
    end
end
