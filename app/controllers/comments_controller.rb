class CommentsController < ApplicationController
  before_action :set_post
  before_action :set_comment, only: [:edit, :update, :destroy]

  def index
    @comments = @post.comments
  end

  def new
    @comment = @post.comments.build
  end

  def create
    @comment = @post.comments.build(comment_params)
    if @comment.save
      flash[:notice] = 'Comment created successfully'
      redirect_to post_comments_path(@post)
    else
      render :new
    end
  end

  def edit; end

  def update
    if @comment.update(comment_params)
      flash[:notice] = 'Comment updated successfully'
      redirect_to post_comments_path(@post)
    else
      render :edit
    end
  end

  def destroy
    @comment.destroy
    flash[:notice] = 'Comment deleted successfully'
    redirect_to post_comments_path(@post)
  end

  private

  def set_post
    @post = Post.find params[:post_id]
  end

  def comment_params
    params.require(:comment).permit(:content)
  end

  def set_comment
    @comment = @post.comments.find(params[:id])
  end

end
