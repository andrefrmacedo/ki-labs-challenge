# frozen_string_literal: true

FactoryBot.define do
  factory :person_slot do
    person { nil }
    slot { nil }
    open { false }
  end
end
