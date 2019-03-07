# frozen_string_literal: true

require 'rails_helper'

RSpec.describe PersonSlot, type: :model do
  context 'validations' do
    subject { build :person_slot, person: create(:person, role: :candidate), slot: create(:slot, date_time: '2019-04-01 09:00:00') }

    it 'is valid with valid data' do
      expect(subject).to be_valid
    end

    it 'is not valid without an open value' do
      subject.open = nil
      expect(subject).not_to be_valid
    end

    it 'is not valid without a person' do
      subject.person = nil
      expect(subject).not_to be_valid
    end

    it 'is not valid without a slot' do
      subject.slot = nil
      expect(subject).not_to be_valid
    end
  end
end
