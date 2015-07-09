class CommentsController < ApplicationController

  def new
    @image = Image.find(params[:image_id])
    @comment = @image.comments.new
  end

  def create
    @image = Image.find(params[:image_id])
    @comment = @image.comments.new(comments_params)
    @comment.user_id = current_user.id
    if @comment.save
      flash[:notice] = "Thanks for commenting!"
      redirect_to image_path(@image.id)
    else
      flash[:notice] = "No comment, sorry. Try again."
      render :new
    end
  end

  def edit
    @image = Image.find(params[:image_id])
    @comment = Comment.find(params[:id])
  end

  def update
    @image = Image.find(params[:image_id])
    @comment = Comment.find(params[:id])
    if @comment.update(comments_params)
      flash[:notice] = "Thanks for updating!"
      redirect_to image_path(@image.id)
    else
      flash[:notice] = "No comment, sorry. Try again."
      render :edit
    end
  end

  def destroy
    @image = Image.find(params[:image_id])
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to image_path(@image.id)
  end

  def comments_params
    params.require(:comment).permit(:comment_text)
  end
end
