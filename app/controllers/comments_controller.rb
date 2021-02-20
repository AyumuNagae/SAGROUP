class CommentsController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]
  before_action :correct_user,   only: :destroy

  def create
    @micropost = Micropost.find(params[:micropost_id])
    @comment = current_user.comments.build(comment_params)
    if @comment.save
      flash[:success] = "コメントしました"
      redirect_to micropost
    else
      @feed_items = current_user.feed.paginate(page: params[:page])
      render 'microposts/show'
    end
  end

  def destroy
    @micropost = Micropost.find(params[:micropost_id])
    @comment.destroy
    flash[:success] = "コメントを削除しました"
    redirect_to request.referrer || micropost
  end

  private

    def comment_params
      params.require(:comment).permit(:content, :user_id, :micropost_id)
    end

    def correct_user
      @comment = current_user.comments.find_by(id: params[:id])
      redirect_to root_url if @comment.nil?
    end
end
