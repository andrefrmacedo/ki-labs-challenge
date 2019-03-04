# frozen_string_literal: true

class PersonSlot < ApplicationRecord
  belongs_to :person
  belongs_to :slot

  validates :person, :slot, :open, presence: true
end
