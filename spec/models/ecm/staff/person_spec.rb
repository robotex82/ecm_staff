require 'spec_helper'

describe Ecm::Staff::Person do
  describe "Associations" do
    it { should have_many :attached_pictures }
    it { should have_many :person_positions }
    it { should have_many :pictures }
    it { should have_many :positions }
  end # describe "Associations"

  describe 'Friendly id' do
    it { should act_as_list }
  end # describe 'Friendly id'

  describe 'Friendly id' do
    it { should have_friendly_id :fullname }
  end # describe 'Friendly id'

  describe 'Markup' do
    it { should have_markup :description }
  end # describe 'Markup'

  describe "Validations" do
    it { should validate_presence_of(:firstname) }
    it { should validate_presence_of(:lastname) }
    it { should validate_presence_of(:markup_language) }
    it { should ensure_inclusion_of(:markup_language).in_array(Ecm::Staff::Configuration.markup_languages.map(&:to_s)) }
  end # describe "Validations"
end
