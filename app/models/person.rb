# frozen_string_literal: true

class Person < ApplicationRecord
  extend Enumerize

  has_many :person_slots
  has_many :slots, through: :person_slots

  enumerize :role, in: [:inverviewer, :candidate], scope: :role

  validates :role, presence: true
end
