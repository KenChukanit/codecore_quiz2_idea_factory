FactoryBot.define do
  factory :idea do
    sequence(:title) { |n| Faker::Movies::StarWars.character + " #{n}"}
    body { Faker::Hacker.say_something_smart }
  
    # association(:user, factory: :user)
  end
end
