class StaticPagesController < ApplicationController
  
  #トップページ
  def home
    @static_pages = Category.where(parent_id: nil)
  end
  
  
end
