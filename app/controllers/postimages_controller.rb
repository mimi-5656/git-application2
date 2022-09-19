class PostimagesController < ApplicationController
  def new
    @post_image = Postimage.new
  end

  def create
    @post_image = PostImage.new(post_image_params)
    @post_image.user_id = current_user.id
    if @post_image.save
      redirect_to post_images_path
    else
      render :new
    end
  end

  def index
    @post_images = Postimage.page(params[:page])
  end

  def show
    @post_image = Postimage.find(params[:id])
    @post_comment = PostComment.new
  end

  def destroy
    @post_image = Postimage.find(params[:id])
    @post_image.destroy
    redirect_to post_images_path
  end

  private

  def post_image_params
    params.require(:post_image).permit(:shop_name, :image, :caption)
  end

end
