class CommentsController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]
  before_action :correct_user,   only: :destroy

  def create
    @comment = current_user.comments.build(comment_params)
    @comment.image.attach(params[:comment][:image])
    if @comment.save
      flash[:success] = "コメントしました"
      redirect_to ##########
    else
      @feed_items = current_user.feed.paginate(page: params[:page])
      render '############'
    end
  end

  def destroy
    @comment.destroy
    flash[:success] = "コメントを削除しました"
    redirect_to request.referrer || ######root_url##########
  end

  private

    def comment_params
      params.require(:comment).permit(:content, :image)
    end

    def correct_user
      @comment = current_user.comments.find_by(id: params[:id])
      redirect_to ###########root_url if @comment.nil?
    end
end