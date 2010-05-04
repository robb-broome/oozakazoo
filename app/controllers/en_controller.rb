class EnController < ApplicationController
  around_filter neo_tx
  def index
    @ens = Entity.nodes.all

  private
  def neo_tx
    Neo4j::Transaction.new
      @actor = Neo4j.load_node(params[:id]) if params[:id]
      yield
    Neo4j::Transaction.finish
  end
end
