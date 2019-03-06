# frozen_string_literal: true

FactoryBot.define do
  factory :person do
    name { Faker::Name.name }

    trait(:interviewer) { role { :interviewer } }
    trait(:candidate) { role { :candidate } }
  end
end
