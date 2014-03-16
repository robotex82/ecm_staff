# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :person_position do
    person nil
    business_unit nil
    position nil
    begin_at "2014-03-16"
    end_at "2014-03-16"
  end
end
