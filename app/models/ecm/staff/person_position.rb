class Ecm::Staff::PersonPosition < Ecm::Staff::Base
  # associations
  has_one    :organisation, :through => :business_unit
  belongs_to :business_unit
  belongs_to :person, :class_name => Ecm::Staff::Configuration.person_class_name
  belongs_to :position


  # attributes
  attr_accessible :begin_at,
                  :business_unit_id,
                  :end_at,
                  :organisation_id,
                  :person_id,
                  :position_id

  # validations
  # @TODO: Validate end_at > begin_at if present
  validates :begin_at,      :presence => true
  validates :business_unit, :presence => true
  validates :person,        :presence => true
  validates :position,      :presence => true
end # class Ecm::Staff::PersonPosition < Ecm::Staff::Base
