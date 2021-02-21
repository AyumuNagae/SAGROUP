class MicropostsController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]
  before_action :correct_user,   only: :destroy

  def show
    @micropost = Micropost.find(params[:id])
    @comments = @micropost.comments
    @comments=@micropost.comments.paginate(page: params[:page])
    @comment = Comment.new
  end

  def create
    @micropost = current_user.microposts.build(micropost_params)
    @micropost.image.attach(params[:micropost][:image])
    if @micropost.save
      flash[:success] = "投稿しました"
      redirect_to root_url
    else
      @feed_items = current_user.feed.paginate(page: params[:page])
      render 'static_pages/home'
    end
  end

  def destroy
    @micropost.destroy
    flash[:success] = "投稿を削除しました"
    redirect_to request.referrer || root_url
  end

  def search
    if params[:game_category].present?
      @microposts = Micropost.where('game_category LIKE ?', "%#{params[:game_category]}%")
    else
      @microposts = Micropost.none
    end
  end

  private

    def micropost_params
      params.require(:micropost).permit(:content, :image, :title, :game_category, :micropost_id, :user_id)
    end

    def correct_user
      @micropost = current_user.microposts.find_by(id: params[:id])
      redirect_to root_url if @micropost.nil?
    end
end
