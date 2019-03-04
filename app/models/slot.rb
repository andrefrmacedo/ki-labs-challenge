# frozen_string_literal: true

class Slot < ApplicationRecord
  has_many :person_slots
  has_many :people, through: :person_slots

  validates :date_time, presence: true
end
