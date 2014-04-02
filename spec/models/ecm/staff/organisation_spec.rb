require 'spec_helper'

describe Ecm::Staff::Organisation do
  describe "Associations" do
    it { should have_many :business_units }
  end # describe "Associations"

  describe 'Friendly id' do
    it { should have_friendly_id :name }
  end # describe 'Friendly id'

  describe 'Markup' do
    it { should have_markup :description }
  end # describe 'Markup'

  describe "Validations" do
    it { should validate_presence_of(:name) }
    it { should validate_uniqueness_of(:name) }
  end # describe "Validations"
end
