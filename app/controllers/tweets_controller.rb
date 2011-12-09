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
    @a = Tweet.find(params[:id])
    @au = @a.author
      respond_to do |format|
      format.json { render :json => Tweet.find(params[:id]).vote_up(current_user, @au) }
      end
  end


  def vote_down
    @a = Tweet.find(params[:id])
    @au = @a.author
      respond_to do |format|
      format.json { render :json => Tweet.find(params[:id]).vote_down(current_user, @au) }
      end
  end

  def to_favorites
      respond_to do |format|
      format.json { render :json => Tweet.find(params[:id]).to_favorites(current_user) }
      end
  end

  def remove_from_favorites
      respond_to do |format|
      format.json { render :json => Tweet.find(params[:id]).remove_from_favorites(current_user) }
      end
  end
end
