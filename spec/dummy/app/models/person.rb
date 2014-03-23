class Person < ActiveRecord::Base
  attr_accessible :firstname, :lastname

  validates :firstname, :presence => true
  validates :lastname,  :presence => true

  def fullname
    "#{firstname} #{lastname}"
  end # def

  def to_s
    fullname
  end # def
end
