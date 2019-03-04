slot_list = [
  { date_time: '2019-04-01 9:00:00' },
  { date_time: '2019-04-01 10:00:00' },
  { date_time: '2019-04-01 11:00:00' },
  { date_time: '2019-04-01 12:00:00' },

  { date_time: '2019-04-02 9:00:00' },
  { date_time: '2019-04-02 10:00:00' },

  { date_time: '2019-04-03 9:00:00' },
  { date_time: '2019-04-03 10:00:00' },
  { date_time: '2019-04-03 11:00:00' },
  { date_time: '2019-04-03 12:00:00' },

  { date_time: '2019-04-04 9:00:00' },
  { date_time: '2019-04-04 10:00:00' },

  { date_time: '2019-04-05 9:00:00' },
  { date_time: '2019-04-05 10:00:00' },
  { date_time: '2019-04-05 11:00:00' },
  { date_time: '2019-04-05 12:00:00' },
]

person_list = [
  { name: 'Ingrid', role: :interviewer },
  { name: 'Ines', role: :interviewer },
  { name: 'Carl', role: :candidate },
  { name: 'Andre', role: :candidate },
]

ingrid_slots = []
ines_slots = []
carl_slots = []
andre_slots = []

slot_list.each do |slot|
  record = Slot.create!(date_time: slot[:date_time])

  ines_slots << record
  carl_slots << record if record.date_time.hour > 9
  ingrid_slots << record if record.date_time.hour > 10
  andre_slots << record if record.date_time.hour > 11
end

person_list.each do |person|
  slots = if person[:name] == 'Ingrid'
            ingrid_slots
          elsif person[:name] == 'Ines'
            ines_slots
          elsif person[:name] == 'Carl'
            carl_slots
          else
            andre_slots
          end

  Person.create!(name: person[:name], role: person[:role], slots: slots)
end


