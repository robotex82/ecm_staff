class Ecm::Staff::Position < ActiveRecord::Base
  # attributes
  attr_accessible :description, :name

  # nested set support
  acts_as_nested_set

  # validations
  validates :name, :presence => true,
                   :uniqueness => true
end # class Ecm::Staff::Position < ActiveRecord::Base
