require 'spec_helper'

describe Ecm::Staff::Organisation do
  describe "Associations" do
    it { should have_many :business_units }
  end # describe "Associations"

  describe "Validations" do
    it { should validate_presence_of(:name) }
    it { should validate_uniqueness_of(:name) }
  end # describe "Validations"
end
