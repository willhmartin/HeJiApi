json.array! @daily_activities do |activity|
  json.extract! activity, :id, :content, :location, :date, :transportation
  json.time_only activity.time.strftime("%R")
  # json.time_only activity.time.strftime("%I:%M%p")
end


# json.array! @activities do |activity|
#   json.extract! activity, :id, :content, :location, :date, :time, :transportation
#   json.time_only activity.time.strftime("%R")
#   # json.time_only activity.time.strftime("%I:%M%p")
# end

# json.array! @daily_activities do |activity|
#   json.extract! activity, :id, :content, :location, :date, :transportation

#   json.activity_date activity.time.to_date
#   json.activity_time activity.time

#   json.time_only activity.time.strftime("%R")
# end
