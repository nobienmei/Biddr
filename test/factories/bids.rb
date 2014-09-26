# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :bid do
    amount 1
    win_bid false
    auction ""
  end
end
