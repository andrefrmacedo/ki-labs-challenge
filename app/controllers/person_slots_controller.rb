# frozen_string_literal: true

class PersonSlotsController < ApplicationController
  def index
    slot_ids = PersonSlot.where(person_id: params[:id], open: true).pluck(:slot_id)
    available_slots = PersonSlot.where(slot_id: slot_ids, person_id: slots_params[:interviewer_ids])
    render json: available_slots, status: :ok, each_serializer: PersonSlotSerializer
  end

  def create
  end

  def update
  end

  private

    def slots_params
      params.permit(interviewer_ids: [])
    end
end
