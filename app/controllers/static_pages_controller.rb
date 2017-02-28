class StaticPagesController < ApplicationController
  
  #トップページ
  def home
    @static_pages = Category.all
  end
  
  
end
