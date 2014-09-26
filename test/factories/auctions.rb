# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :auction do
    title "MyString"
    details "MyText"
    end_date "2014-09-26 10:13:29"
    reserve_price 1
  end
end
