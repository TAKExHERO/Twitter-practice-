class BlogsController < ApplicationController
  before_action :set_blogs, only: [:edit, :update, :destroy]
  
  def index
    @blogs = Blog.all
  end

  def new
    if params[:back]
      @blogs = Blog.new(blogs_params)
    else
      @blogs = Blog.new
    end
  end

  def create
    @blogs = Blog.new(blogs_params)
    if @blogs.save
     redirect_to blogs_path, notice: "ツイートを作成しました！"
    else
      render action: 'new'
    end
  end
  
  def edit
  end
  
  def update
    @blogs.update(blogs_params)
    redirect_to blogs_path, notice: "ツイートを更新しました！"
  end
  
  def destroy
    @blogs.destroy
    redirect_to blogs_path, notice: "ツイートを削除しました！"
  end
  
  def confirm
    @blogs = Blog.new(blogs_params)
    render :new if @blogs.invalid?
  end
  
   private
    def blogs_params
      params.require(:blog).permit(:content)
    end
    
    def set_blogs
    @blogs = Blog.find(params[:id])
    end
    
end
