# frozen_string_literal: true

class PersonSlotsController < ApplicationController
  before_action :valid_candidate?

  def index
    slot_ids = PersonSlot.includes(:person).where(person_id: params[:id], open: true, people: { role: :candidate }).pluck(:slot_id)
    available_slots = PersonSlot.where(slot_id: slot_ids, person_id: slots_params[:interviewer_ids])
    render json: available_slots, status: :ok, each_serializer: PersonSlotSerializer
  end

  def create
    # TODO
  end

  def update
    # TODO
  end

  private

    def slots_params
      params.permit(interviewer_ids: [])
    end

    def valid_candidate?
      candidate = Person.role(:candidate).find_by(id: params[:id])
      render json: error_message(I18n.t('errors.candidate.not_found')), status: :not_found unless candidate
    end
end
