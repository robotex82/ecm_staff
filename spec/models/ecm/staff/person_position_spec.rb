require 'spec_helper'

describe Ecm::Staff::PersonPosition do
  describe "Associations" do
    it { should have_one :organisation }
    it { should belong_to :business_unit }
    it { should belong_to :person }
    it { should belong_to :position }
  end # describe "Associations"

  describe "Validations" do
    it { should validate_presence_of(:begin_at) }
    it { should validate_presence_of(:business_unit) }
    it { should validate_presence_of(:position) }
    it { should validate_presence_of(:person) }
  end # describe "Validations"
end # describe Ecm::Staff::PersonPosition
