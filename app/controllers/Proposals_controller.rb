class ProposalsController < ApplicationController

  def index
    @Proposals = Proposal.all
  end

  def show
    @Proposals = Proposal.find(params[:id])
  end

  def new
    @Proposals = Proposal.new
  end

  def edit
    @Proposals = Proposal.find(params[:id])
  end

  def create
    @Proposals = Proposal.new(params[:proposal])
  end

  def update
    @Proposals = Proposal.find(params[:id])
  end

  def destroy
    @Proposals = Proposal.find(params[:id])
    @Proposals.destroy
  end

end
