class EdgesController < ApplicationController
  def index
    @edges = BaseEdge.all
  end

  def new
    @edge = BaseEdge.new
  end

  def show
    @edge = BaseEdge.find(params[:id])
  end

  def create
    # allow passing an entity here ooz/edge/entity1/entity2?type=sometype POST
    # hmm. an edge can't be created without an entity, right? :w
    @edge = BaseEdge.create!(params[:edge])
    notice "Edge Created #{@edge.edge_type}"
    redirect_to edges_path
  end
end
