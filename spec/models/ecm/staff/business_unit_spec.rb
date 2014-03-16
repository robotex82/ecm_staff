require 'spec_helper'

describe Ecm::Staff::BusinessUnit do
  describe "Associations" do
    it { should belong_to :organisation }
  end # describe "Associations"

  describe "Nested set support" do
    it { should respond_to(:root) }
  end # describe "Nested set support"

  describe "Validations" do
    it { should validate_presence_of(:name) }
    it { should validate_uniqueness_of(:name).scoped_to(:organisation_id) }
    it { should validate_presence_of(:organisation) }
  end # describe "Validations"
end # describe Ecm::Staff::BusinessUnit
