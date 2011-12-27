class ProposalsController < ApplicationController

  def index
    @proposals = Proposal.all
  end

  def show
    @proposals = Proposal.find(params[:id])
  end

  def new
    @proposals = Proposal.new
  end

  def edit
    @proposals = Proposal.find(params[:id])
  end

  def create
    @proposals = Proposal.new(params[:proposal])
  end

  def update
    @proposals = Proposal.find(params[:id])
  end

  def destroy
    @proposals = Proposal.find(params[:id])
    @proposals.destroy
  end

end
