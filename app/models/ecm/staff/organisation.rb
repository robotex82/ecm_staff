class Ecm::Staff::Organisation < Ecm::Staff::Base
  # associations
  has_many :business_units

  # attributes
  attr_accessible :description,
                  :markup_language,
                  :name

  # callbacks
  after_initialize :set_defaults

  # friendly id support
  extend FriendlyId
  friendly_id :name, :use => :slugged

  # markup support
  acts_as_markup :language => :variable,
                 :columns  => [ :description ]

  # validations
  validates :markup_language, :inclusion => Ecm::Staff::Configuration.markup_languages.map(&:to_s)
  validates :name, :presence   => true,
                   :uniqueness => true

  def to_s
    name
  end # def

  private

  def set_defaults
    if self.new_record?
      self.markup_language ||= Ecm::Staff::Configuration.default_markup_language
    end # if
  end # def
end # class Ecm::Staff::Organisation < Ecm::Staff::Base
