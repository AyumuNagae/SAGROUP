module ApplicationHelper

  # ページごとの完全なタイトルを返します。
  def full_title(page_title = '')
    base_title = "SAGROUP"
    if page_title.empty?
      base_title + '仲間を見つけよう'
    else
      page_title + " | " + base_title
    end
  end
end
