require 'spec_helper'

describe Ecm::Staff::Position do
  describe "Associations" do
  end # describe "Associations"

  describe "Nested set support" do
    it { should respond_to(:root) }
  end # describe "Nested set support"

  describe "Validations" do
    it { should validate_presence_of(:name) }
    it { should validate_uniqueness_of(:name) }
  end # describe "Validations"
end # describe Ecm::Staff::Position
