# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :ecm_staff_person_position, :class => Ecm::Staff::PersonPosition do
    association :person, :factory => :ecm_staff_person
    association :business_unit, :factory => :ecm_staff_business_unit
    association :position, :factory => :ecm_staff_position
    begin_at 1.year.ago
  end
end
