# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :ecm_staff_person, :class => Ecm::Staff::Person do
    firstname 'John'
    lastname 'Doe'
  end
end
