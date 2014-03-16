class Ecm::Staff::BusinessUnit < ActiveRecord::Base
  # associations
  belongs_to :organisation

  # attributes
  attr_accessible :description, :name

  # nested set support
  acts_as_nested_set

  # validations
  validates :organisation, :presence => true
  validates :name, :presence => true,
                   :uniqueness => { :scope => [ :organisation_id ] }
end # class Ecm::Staff::BusinessUnit < ActiveRecord::Base
