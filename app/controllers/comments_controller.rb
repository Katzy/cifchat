class CommentsController < ApplicationController


  def index
    @user = current_user
    @comments = Comment.last(10)
    # @comments = []
    # @cmts = Comment.all
    # @cmts.each do |comment|
    #   if comment.admin
    #     @comments << comment
    #   else
    #     comment.body = "msg sent to moderators!"
    #     @comments << comment
    #   end
    # end
    # @comments = @comments[-6..-1]
    respond_to do |format|
      format.html
      format.js
    end
  end

  def new
    @comment = Comment.new
    @comments = Comment.order('created_at ASC')
  end

  def destroy
  end


  def create
    @comment = current_user.comments.build(comment_params)
    @user = current_user


    if current_user.admin?
      @comment.admin = true
    end
    @comment.save

  end


  def comment_params
    params.require(:comment).permit(:body, :admin, :user_id)
  end

end