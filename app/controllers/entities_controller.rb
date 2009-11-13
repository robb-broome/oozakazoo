class EntitiesController < ApplicationController
  def index
    @entities = Entity.all
  end
  
  def new
    @entity = Entity.new
  end 
  
  def create
    params[:entity][:uuid] = UUID.new
    @entity = Entity.create(params[:entity])
    
    flash[:notice] = "Entity Created"
    redirect_to entities_path
  end

end
