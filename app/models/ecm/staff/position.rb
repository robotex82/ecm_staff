class Ecm::Staff::Position < Ecm::Staff::Base
  # associations
  has_many :person_positions, :dependent => :restrict
  has_many :people, :through => :person_positions,
                    :class_name => Ecm::Staff::Configuration.person_class_name

  # attributes
  attr_accessible :description,
                  :name,
                  :parent_id

  # callbacks
  after_initialize :set_defaults

  # globalization support
  translates :description, :name, :slug
  attr_accessible :translations, :translations_attributes
  accepts_nested_attributes_for :translations

  # friendly id support
  extend FriendlyId
  friendly_id :name, :use => :slugged

  # markup support
  acts_as_markup :language => :variable,
                 :columns  => [ :description ]

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

  private

  def set_defaults
    if self.new_record?
      self.markup_language ||= Ecm::Staff::Configuration.default_markup_language
    end # if
  end # def
end # class Ecm::Staff::Position < Ecm::Staff::Base
