class Ecm::Staff::BusinessUnit < Ecm::Staff::Base
  # associations
  belongs_to :organisation
  has_many :person_positions, :dependent => :restrict
  has_many :people, :through => :person_positions

  # attributes
  attr_accessible :description,
                  :name,
                  :markup_language,
                  :organisation_id,
                  :parent_id,
                  :slug

  # callbacks
  after_initialize :set_defaults

  # globalization support
  translates :description, :name, :slug
  attr_accessible :translations, :translations_attributes
  accepts_nested_attributes_for :translations

  # default scope
  default_scope :order => 'lft'

  # friendly id support
  extend FriendlyId
  friendly_id :name, :use => :slugged

  # markup support
  acts_as_markup :language => :variable,
                 :columns  => [ :description ]

  # nested set support
  acts_as_nested_set

  # validations
  validates :organisation, :presence => true
  validates :name, :presence => true,
                   :uniqueness => { :scope => [ :organisation_id ] }

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
end # class Ecm::Staff::BusinessUnit < Ecm::Staff::Base
