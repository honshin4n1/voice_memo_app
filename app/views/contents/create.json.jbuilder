json.id @content.id
json.title @content.title
json.comment @content.comment
json.start_time @content.start_time.strftime('%Y/%m/%d (%a) %H:%M')
json.updated_at @content.updated_at.strftime("%Y/%m/%d (%a) %H:%M")
json.genre_id @content.genre.id
