FactoryBot.define do
  factory :profile do
    username { "#{Faker::Name.first_name}-#{Faker::Name.last_name}" }
    superuser { false }
  end
end