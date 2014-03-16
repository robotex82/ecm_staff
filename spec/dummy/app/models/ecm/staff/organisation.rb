class Ecm::Staff::Organisation < ActiveRecord::Base
  # associations
  has_many :business_units

  # attributes
  attr_accessible :description, :name

  # validations
  validates :name, :presence => true,
                  :uniqueness => true
end # class Ecm::Staff::Organisation < ActiveRecord::Base
