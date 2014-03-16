# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :ecm_staff_position, :class => Ecm::Staff::Position do
    sequence(:name) { |i| "Organisation ##{i}" }
  end
end
