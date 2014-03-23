class Ecm::Staff::BusinessUnit < Ecm::Staff::Base
  # associations
  belongs_to :organisation

  # attributes
  attr_accessible :description,
                  :name,
                  :organisation_id,
                  :parent_id

  # nested set support
  acts_as_nested_set

  # validations
  validates :organisation, :presence => true
  validates :name, :presence => true,
                   :uniqueness => { :scope => [ :organisation_id ] }

  def to_s
    name
  end # def
end # class Ecm::Staff::BusinessUnit < Ecm::Staff::Base
