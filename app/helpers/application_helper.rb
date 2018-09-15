module ApplicationHelper
  def page_title
    title = "BestAnswer" #デフォルト
    title = @page_title + " | " + title if @page_title
    title
  end
end
