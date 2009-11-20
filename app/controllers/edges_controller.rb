class EdgesController < ApplicationController
  def index
    @edges = Edge.all
  end

  def new
    @edge = Edge.new
  end

  def show
    @edge = Edge.find(params[:id])
  end 
  
  def create
    @edge = Edge.create!(params[:edge])
    notice "Edge Created #{@edge.edge_type}"
    redirect_to edges_path
  end
end