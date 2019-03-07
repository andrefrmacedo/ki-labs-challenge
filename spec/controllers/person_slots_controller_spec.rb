# frozen_string_literal: true

require 'rails_helper'

RSpec.describe PersonSlotsController, type: :controller do
  let!(:candidate1) { create :person, role: :candidate }
  let!(:interviewer1) { create :person, role: :interviewer }
  let!(:interviewer2) { create :person, role: :interviewer }
  let!(:slot1) { create :slot, date_time: '2019-04-01 09:00:00' }
  let!(:slot2) { create :slot, date_time: '2019-04-01 10:00:00' }
  let!(:slot3) { create :slot, date_time: '2019-04-01 11:00:00' }
  let!(:person_slot1) { create :person_slot, person: candidate1, slot: slot1 }
  let!(:person_slot2) { create :person_slot, person: candidate1, slot: slot2 }
  let!(:person_slot3) { create :person_slot, person: candidate1, slot: slot3 }
  let!(:person_slot4) { create :person_slot, person: interviewer1, slot: slot1 }
  let!(:person_slot5) { create :person_slot, person: interviewer2, slot: slot1 }

  describe 'GET #person_slots' do
    it 'returns correct slots' do
      person_slot6 = create(:person_slot, person: interviewer2, slot: slot2)

      get :index, params: { id: candidate1.id, interviewer_ids: [interviewer1.id, interviewer2.id] }

      expect(response).to have_http_status(:success)
      expect(json_response.count).to eq(3)
      expect(json_response.first['id']).to eq(person_slot4.id)
      expect(json_response.first['slot_id']).to eq(slot1.id)
      expect(json_response.second['id']).to eq(person_slot5.id)
      expect(json_response.second['slot_id']).to eq(slot1.id)
      expect(json_response.third['id']).to eq(person_slot6.id)
      expect(json_response.third['slot_id']).to eq(slot2.id)
    end

    it 'returns correct slots' do
      get :index, params: { id: candidate1.id, interviewer_ids: [interviewer1.id, interviewer2.id] }

      expect(response).to have_http_status(:success)
      expect(json_response.count).to eq(2)
      expect(json_response.first['id']).to eq(person_slot4.id)
      expect(json_response.first['slot_id']).to eq(slot1.id)
      expect(json_response.second['id']).to eq(person_slot5.id)
      expect(json_response.second['slot_id']).to eq(slot1.id)
    end

    it 'return not found error' do
      get :index, params: { id: candidate1.id + 1 }

      expect(response).to have_http_status(:not_found)
      expect(json_response['error']).to eq(I18n.t('errors.candidate.not_found'))
    end
  end
end
