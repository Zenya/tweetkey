class SlaviksController < ApplicationController

  def index
    @slaviks = Slavik.all
  end

  def show
    @slaviks = Slavik.find(params[:id])
  end

  def new
    @slaviks = Slavik.new
  end

  def edit
    @slaviks = Slavik.find(params[:id])
  end

  def create
    @slaviks = Slavik.new(params[:proposal])
  end

  def update
    @slaviks = Slavik.find(params[:id])
  end

  def destroy
    @slaviks = Slavik.find(params[:id])
    @slaviks.destroy
  end

end
