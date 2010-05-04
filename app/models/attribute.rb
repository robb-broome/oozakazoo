class Attribute < OozaNodeBase
  property :name, :value
  index :name, :value
  has_n(:ens).from(En, :has)
end
