class Admin::CommentsController < ApplicationController
  def create
    @content = get_commentable
    @comment = @content.comments.create(comment_params)
    
    respond_to do |format|    
        if(@comment.save)
            format.html { redirect_to [:admin, @content] }
            format.json
        else
            format.html { render :new }
            format.js { @messages }
        end
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end
  
  private
    def comment_params
        params.require(:comment).permit(:body, :user_id, :commentable)
    end
    def get_commentable
        params.each do |name, value|
            if name =~ /(.+)_id$/
                return $1.classify.constantize.find(value) 
            end
        end
        nil 
    end
end
