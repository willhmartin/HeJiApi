json.array! @daily_activities do |activity|
  json.extract! activity, :id, :content, :location, :date, :time, :transportation
  json.time_only activity.time.strftime("%I:%M%p")
end