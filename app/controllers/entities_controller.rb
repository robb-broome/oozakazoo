class EntitiesController < ApplicationController
  def index
    @entities = Entity.all
  end

  def new
    @owners = Entity.find(:all, :conditions => {:entity_type_uuid => entity_types[:user]}).collect {|owner| [owner.title, owner.uuid]}
    puts "owners are #{@owners}"
    @entity = Entity.new
  end

  def create
    puts "params are #{params.inspect}"
    owner = params[:entity].delete :owner_uuid
    @entity = Entity.create!(params[:entity])
    if owner
      @entity.owner_uuid = owner
      @entity.save

    end
    notice "Entity Created #{@entity.title} #{@entity.content}"
    redirect_to entities_path
  end
end
