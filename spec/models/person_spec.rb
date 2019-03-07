# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Person, type: :model do
  context 'validations' do
    subject { build :person, role: :candidate }

    it 'is valid with valid data' do
      expect(subject).to be_valid
    end

    it 'is not valid without a role' do
      subject.role = nil
      expect(subject).not_to be_valid
    end
  end
end
