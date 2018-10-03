json.current_page @page
json.per_page @limit
json.total_entries @total

json.entries @units do |unit|
  json.extract! unit, :id, :name, :address, :city, :phone 
  json.geocode do
    json.lat unit.latitude
    json.long unit.longitute
  end
  json.scores do
    json.size unit.size
    json.adaptation_for_seniors unit.adaptation_for_seniors
    json.medical_equipment unit.medical_equipment
    json.medicine unit.medicine
  end
end