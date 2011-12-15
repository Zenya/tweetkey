class TweetsController < ApplicationController
  before_filter :authenticate_user!, :except => [:index, :show]

  def index
    @tweets = Tweet.all

    #    respond_to  do |format|
    #      format.xml{render :xml => @tweets.to_xml}
    #    end
  end

  def new
    @tweet = Tweet.new
  end

  def create
    @tweet = Tweet.create!(params[:tweet])
    if @tweet.save
      redirect_to :action => "show", :id => @tweet
    else
      render action: "new"
    end
  end

  def show
    @tweet = Tweet.find(params[:id])
    if user_signed_in?
      @todo = @tweet.in_favorites.include?(current_user.id) ? "remove" : "add"
    end
  end

  def edit
    @tweet = Tweet.find(params[:id])
  end

  def update
    @tweet = Tweet.find(params[:id])
    if @tweet.update_attributes(params[:tweet])
      redirect_to tweet_path(@tweet)
    end
  end

  def destroy
    @tweet = Tweet.find(params[:id])
    @tweet.destroy

    respond_to do |format|
      format.html { redirect_to tweets_url }
      format.json { head :ok }
    end
  end

  def rank
    @tweet = Tweet.find(params[:id])
    @author = @tweet.author
      @tweet.vote(current_user, @author, params[:rate]) 
    respond_to do |format|
      format.js
    end
  end

  def favorites
    respond_to do |format|
      format.json { render :json => Tweet.find(params[:id]).favorites(current_user, params[:todo]) }
    end
  end
end
