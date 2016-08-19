class CommentsController < ApplicationController

  def create
    parent
    @comment = @parent.comments.new(comment_params)

    if @comment.save
      redirect_to @parent, notice: "Comment was saved"
    else
      redirect_to @parent, notice: "Comment couldn't saved"
    end

  end

  def destroy
    parent
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to @parent, notice: 'Comment was deleted.'
  end
  private
    def parent
      @parent = Book.find(params[:book_id]) if params[:book_id]
      @parent = Author.find(params[:author_id]) if params[:author_id]
    end

    def comment_params
      params.require(:comment).permit(:body)
    end
end
