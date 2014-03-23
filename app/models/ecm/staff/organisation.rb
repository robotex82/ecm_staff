class Ecm::Staff::Organisation < Ecm::Staff::Base
  # associations
  has_many :business_units

  # attributes
  attr_accessible :description, :name

  # validations
  validates :name, :presence => true,
                  :uniqueness => true

  def to_s
    name
  end # def
end # class Ecm::Staff::Organisation < Ecm::Staff::Base
