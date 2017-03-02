class CategoriesController < ApplicationController
  
  #テーマをすべて表示
  def show
    #テーマをすべて取り出す。
    @themes = Category.where(parent_id: params[:id] )
  end
  
  #それぞれのテーマの動画を表示
  def index
    #動画を取り出す。todo:取り出す方法を模索
    theme = Category.find_by(id: params[:theme])
    @videos = theme.videos
  end
  
  
end
