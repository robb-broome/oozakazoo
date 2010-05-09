class OozaNodeBase
  include Neo4j::NodeMixin
  property :uuid
  index :uuid
  has_n(:attribute).to(Attribute).relationship(Has)
  has_n(:attribute).to(Attribute).relationship(Is)
end
