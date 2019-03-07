# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Slot, type: :model do
  context 'validations' do
    subject { build :slot, date_time: '2019-04-01 09:00:00' }

    it 'is valid with valid data' do
      expect(subject).to be_valid
    end

    it 'is not valid without a date_time' do
      subject.date_time = nil
      expect(subject).not_to be_valid
    end
  end
end
