json.count            @events.count
json.events do
  json.array! (@events) do |event|
    json.(event, :id, :name, :begin_date, :end_date, :content, :image)
  end
end