include UUIDHelper
class EntitiesController < ApplicationController
  def index
    @entities = Entity.all
  end
  
  def new
    @entity = Entity.new
  end 
  
  def create
    @entity = Entity.create!(params[:entity])
    notice "Entity Created #{@entity.title} #{@entity.content}"
    redirect_to entities_path
  end

end
