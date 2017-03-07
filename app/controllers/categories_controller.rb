class CategoriesController < ApplicationController
  
  #カテゴリの動画すべてとそのカテゴリのテーマをすべて表示
  def show
    #カテゴリー動画をすべて取り出す
    @videos = Category.find_by(id: params[:id]).videos
    #テーマをすべて取り出す。
    @themes = Category.where(parent_id: params[:id] )
  end
  
  #それぞれのテーマの動画を表示
  def index
    #動画を取り出す
    theme = Category.find_by(id: params[:theme])
    @videos = theme.videos.reorder(score: :desc)
  end
  
  
end
