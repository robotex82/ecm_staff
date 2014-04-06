class Ecm::Staff::Person < Ecm::Staff::Base
  # associations
  has_many :person_positions, :class_name => Ecm::Staff::PersonPosition,
                              :order => 'begin_at DESC',
                              :inverse_of => :person
  accepts_nested_attributes_for :person_positions, :allow_destroy => true

  has_many :positions, :through => :person_positions,
                       :class_name => Ecm::Staff::Position

  has_many :attached_pictures, :as => :pictureable,
                               :class_name => Ecm::Pictures::AttachedPicture,
                               :inverse_of => :pictureable
  has_many :pictures, :through => :attached_pictures,
                      :class_name => Ecm::Pictures::Picture

  accepts_nested_attributes_for :attached_pictures, :allow_destroy => true
  accepts_nested_attributes_for :pictures, :allow_destroy => true

  # attributes
  attr_accessible :attached_pictures_attributes,
                  :birthdate,
                  :description,
                  :firstname,
                  :lastname,
                  :markup_language,
                  :person_positions_attributes,
                  :pictures_attributes,
                  :position,
                  :prefix

  # acts as list
  acts_as_list
  default_scope :order => 'position ASC'

  # callbacks
  after_initialize :set_defaults

  # friendly id support
  extend FriendlyId
  friendly_id :fullname, :use => :slugged

  # markup support
  acts_as_markup :language => :variable,
                 :columns  => [ :description ]

  # validations
  validates :markup_language, :presence => true,
                              :inclusion => Ecm::Staff::Configuration.markup_languages.map(&:to_s)
  validates :firstname, :presence => true
  validates :lastname,  :presence => true

  def age
    return if birthdate.nil?
    if (Time.zone.now.month < self.birthdate.month) ||  (Time.zone.now.month == self.birthdate.month && self.birthdate.day >= Time.zone.now.day)
      Time.zone.now.year - self.birthdate.year - 1
    else
      Time.zone.now.year - self.birthdate.year
    end
  end # def

  def fullname
    "#{firstname} #{lastname}"
  end # def

  def fullname_with_prefix
    prefix.present? ? "#{prefix} #{fullname}" : fullname
  end # def

  def preview_picture
    pictures.first
  end # def

  def preview_picture_image_url(style = nil)
    preview_picture.image.url(style) if preview_picture.respond_to?(:image) && preview_picture.image.respond_to?(:url)
  end # def

  def to_s
    fullname
  end # def

  private

  def set_defaults
    if self.new_record?
      self.markup_language ||= Ecm::Staff::Configuration.default_markup_language
    end # if
  end # def
end
