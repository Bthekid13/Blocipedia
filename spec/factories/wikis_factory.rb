FactoryGirl.define do
  factory :wiki do
    title "Dylan"
    body "Highway 61"
    user User.last
  end
end
