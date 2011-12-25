class ProposalsController < ApplicationController

  def index
    @proposals = Proposal.all
  end

  def show
    @proposal = Proposal.find(params[:id])
  end

  def new
    @proposal = Proposal.new
  end

  def edit
    @proposal = Proposal.find(params[:id])
  end

  def create
    @proposal = Proposal.new(params[:proposal])
  end

  def update
    @proposal = Proposal.find(params[:id])
  end

  def destroy
    @proposal = Proposal.find(params[:id])
    @proposal.destroy
  end

end
