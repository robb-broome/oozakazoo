class EntitiesController < ApplicationController
  before_filter :find_entity, :only => [:show, :delete]
  def index
    @entities = Entity.all
  end

  def new
    @owners = Entity.find(:all, :conditions => {:entity_type_uuid => Entity.types[:user]}).collect {|owner| [owner.title, owner.uuid]}
    @entity = Entity.new
  end

  def show
  end 
  
  def create
    owner = params[:entity].delete :owner_uuid
    @entity = Entity.create!(params[:entity])
    if owner
      @entity.owner_uuid = owner
      @entity.save

    end
    notice "Entity Created #{@entity.title} #{@entity.content}"
    redirect_to entities_path
  end
  
  def delete
    @entity.delete
    notice "Entity Deleted #{@entity.title} #{@entity.content}"
  end 
  
  private 
  
  def find_entity
    @entity = Entity.find(params[:id])
  end 
    
  
end
