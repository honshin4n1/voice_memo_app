json.arry! @contents do |content|
  json.id @content.id
  json.title @content.title
  json.comment @content.comment
  json.genre_name @content.genre.name
  json.genre_id @content.genre.id
  json.start_time @content.start_time.strftime('%Y/%m/%d (%a) %H:%M')
  json.updated_at @content.updated_at.strftime("%Y/%m/%d (%a) %H:%M")
end