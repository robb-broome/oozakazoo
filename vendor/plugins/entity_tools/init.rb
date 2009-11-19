require 'entity_tools'
require 'uuid'

ActionController::Base.send(:include, Ent::Globals)
ActionView::Base.send(:include, Ent::Globals)
ActiveRecord::Base.send(:include, Ent::Globals)