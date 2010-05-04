class En < OozaNodeBase
  property :name
  index :name
  has_n(:attributes).to(Attribute).relationship(Has)
end
