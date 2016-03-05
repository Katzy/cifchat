class CommentsController < ApplicationController


  def index
    @user = current_user
    @comments = []
    @cmts = Comment.all
    @cmts.each do |comment|
      if comment.admin
        @comments << comment
      else
        comment.body = "msg sent to moderators!"
        @comments << comment
      end
    end
    @comments = @comments[-6..-1]
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
    @user = current_user
    @comment = Comment.new(comment_params)
    @comment.user_id = @user.id
    if current_user.admin?
      @comment.admin = true
    end
    if @comment.save
      respond_to do |format|

        format.js
      end
    end
    if !@comment.admin
      PrivatePub.publish_to("/comments/new", "alert('#{@comment.user.name.upcase} from #{@comment.user.city}: #{@comment.body}');")
      PrivatePub.subscribe_to("/comments/new")
    end

  end


  def comment_params
    params.require(:comment).permit(:body, :admin, :user_id)
  end

end