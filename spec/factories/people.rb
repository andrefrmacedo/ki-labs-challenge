# frozen_string_literal: true

FactoryBot.define do
  factory :person do
    name { Faker::Name.name }
  end
end
