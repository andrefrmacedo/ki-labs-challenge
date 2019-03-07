# frozen_string_literal: true

class PersonSlotSerializer < ActiveModel::Serializer
  attributes :id, :slot_id, :slot_date

  def slot_date
    object.slot.date_time
  end

  belongs_to :person
end
