class StaticPagesController < ApplicationController
  def home
    @microposts = Micropost.paginate(page: params[:page], per_page: 5)
    if logged_in?
      @micropost  = current_user.microposts.build
      @feed_items = current_user.feed.paginate(page: params[:page])
    end
  end

  def help
  end

  def about
  end

  def contact
  end
end
