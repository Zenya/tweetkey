class CommentsController < ApplicationController

  before_filter :authenticate_user!

  def create
    @tweet = Tweet.find(params[:tweet_id])
    @comment = @tweet.comments.create!(params[:comment])
    redirect_to @tweet, :notice => "Comment created!"
  end

  def destroy
    @tweet = Tweet.find(params[:tweet_id])
    @tweet.comment.destroy!(params[:comment])

    redirect_to @tweet, :notice => "Comment deleted!"
  end
  def show

  end


end
