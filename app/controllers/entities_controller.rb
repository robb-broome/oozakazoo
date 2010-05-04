class EntitiesController < ApplicationController
  before_filter :find_entity, :only => [:show, :delete]
  def index
    @entities = BaseEntity.all
  end

  def new
    @owners = BaseEntity.find(:all, :conditions => {:entity_type_uuid => BaseEntity.types[:user]}).collect {|owner| [owner.title, owner.uuid]}
    @entity = BaseEntity.new
  end

  def show
  end

  # this needs to be a resource called 'link' or 'edge'
  def create_linked
    # create an entity, and save (blank)
    owner = params[:entity].delete :owner_uuid
    linked_from = params[:entity].delete :linked_from

    @entity = BaseEntity.create!(:title => 'enter a title', :description => 'enter a descr')
    @edge = Edge.create!(:end1 => linked_from, :end2 => @entity.uuid)
    if owner
      @entity.owner_uuid = owner
      @entity.save

    end
    notice "Entity Created #{@entity.title} #{@entity.content} and linked to a new entity "
    redirect_to entity_path, :params => {:id => @entity.uuid}
  end

  def create
    owner = params[:entity].delete :owner_uuid
    @entity = BaseEntity.create!(params[:entity])
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
    @entity = BaseEntity.find(params[:id])
  end

end
