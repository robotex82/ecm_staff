require 'spec_helper'

describe Ecm::Staff::BusinessUnit do
  describe "Associations" do
    it { should belong_to :organisation }
    it { should have_many :person_positions }
    it { should have_many :people }
  end # describe "Associations"

#  describe 'Acts as published' do
#    it { should act_as_published }
#  end # describe 'Markup'

  describe "Nested set support" do
    it { should respond_to(:root) }
  end # describe "Nested set support"

  describe 'Friendly id' do
    it { should have_friendly_id :name }
  end # describe 'Friendly id'

  describe 'Markup' do
    it { should have_markup :description }
  end # describe 'Markup'

  describe "Validations" do
    it { should validate_presence_of(:name) }
    it { should validate_uniqueness_of(:name).scoped_to(:organisation_id) }
    it { should validate_presence_of(:organisation) }
  end # describe "Validations"
end # describe Ecm::Staff::BusinessUnit
