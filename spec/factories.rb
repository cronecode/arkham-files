FactoryGirl.define do
  factory :investigator do
    name "Zoey Samaras"
  end
  factory :scenario do
    name "The House Always Wins"
    complete false
    order 1
  end
  factory :campaign do
    name "Dunwich Legacy"
  end
end