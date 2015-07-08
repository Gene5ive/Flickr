class ImagesController < ApplicationController

  def index
    @user = current_user
    @images = Image.all
  end

  def show
    @image = Image.find(params[:id])
    @user = User.find(@image.user_id)
  end

  def new
    @user = current_user
    @image = Image.new
  end

  def create
    @user = current_user
    @image = Image.new(image_params)
    @image.user_id = current_user.id
    if @image.save
      flash[:notice] = "Your image has been uploaded."
      redirect_to images_path
    else
      flash[:notice] = "There was a problem with your upload."
      render :new
    end
  end

  private
  def image_params
    params.require(:image).permit(:attached_image, :image_caption)
  end
end
