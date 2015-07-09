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

  def edit
    @image = Image.find(params[:id])
  end

  def update
    @image = Image.find(params[:id])
    if @image.update(image_params)
      flash[:notice] = "Caption edited."
      redirect_to image_path(@image.id)
    else
    end
  end

  def destroy
    @image = Image.find(params[:id])
    @image.destroy
    redirect_to images_path
  end

  private
  def image_params
    params.require(:image).permit(:attached_image, :image_caption)
  end
end
