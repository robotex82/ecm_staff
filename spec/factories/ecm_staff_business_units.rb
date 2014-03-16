# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :ecm_staff_business_unit, :class => Ecm::Staff::BusinessUnit do
    association :organisation, :factory => :ecm_staff_organisation
    sequence(:name) { |i| "Organisation ##{i}" }
  end
end
