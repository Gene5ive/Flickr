class TagsController < ApplicationController
  def new
    @image = Image.find(params[:image_id])
    @tag = @image.tags.new
  end

  def create
    @users = User.all
    @image = Image.find(params[:image_id])
    @tag = @image.tags.new(tag_params)
    @users.each do |user|
      if @tag.tag_label === user.username
        @tag.user_id = user.id
      end
    end
    if @tag.save
      flash[:notice] = "Tag, you're it!"
      redirect_to image_path(@image.id)
    else
      flash[:notice] = "There was an error. Please try again."
      render :new
    end
  end

  def edit
    @image = Image.find(params[:image_id])
    @tag = Tag.find(params[:id])
  end

  def update
    @image = Image.find(params[:image_id])
    @tag = Tag.find(params[:id])
    if @tag.update(tag_params)
      flash[:notice] = "Tag Updated."
      redirect_to image_path(@image.id)
    else

    end
  end

  def destroy
    @image = Image.find(params[:image_id])
    @tag = Tag.find(params[:id])
    @tag.destroy
    redirect_to image_path(@image.id)
  end

  private
  def tag_params
    params.require(:tag).permit(:tag_label)
  end
end
