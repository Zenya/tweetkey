class TweetsController < ApplicationController
  before_filter :authenticate_user!, :except => [:show, :index]

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
    if @tweet.in_favorites.include?(current_user.id)
      @todo = "remove"
    else
      @todo = "add"
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

  def vote_up
    @tweet = Tweet.find(params[:id])
    @author = @tweet.author
    @tweet.vote_up(current_user, @author) 
    respond_to do |format|
#      format.json { render :json => }
      format.js { render :partial => "/tweets/rank" }
    end
  end

  def vote_down
    @tweet = Tweet.find(params[:id])
    @author = @tweet.author
      respond_to do |format|
      format.json { render :json => Tweet.find(params[:id]).vote_down(current_user, @author) }
      end
  end


  def favorites
    respond_to do |format|
      format.json { render :json => Tweet.find(params[:id]).favorites(current_user, params[:todo]) }
    end
  end
end
