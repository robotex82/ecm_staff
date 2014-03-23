class Ecm::Staff::Position < Ecm::Staff::Base
  # associations
  has_many :person_positions
  has_many :people, :through => :person_positions,
                    :class_name => Ecm::Staff::Configuration.person_class_name

  # attributes
  attr_accessible :description, :name, :parent_id

  # nested set support
  acts_as_nested_set

  # validations
  validates :name, :presence => true,
                   :uniqueness => true

  def people_count
    people.count
  end # def

  def to_s
    name
  end # def
end # class Ecm::Staff::Position < Ecm::Staff::Base
