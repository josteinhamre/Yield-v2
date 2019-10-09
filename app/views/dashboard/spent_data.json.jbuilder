datasets = [{
  data: @chart_spent_per_day,
  border_color: "#83BED3",
  fill: false
}]

json.labels (1..@chart_spent_per_day.count).to_a
json.datasets datasets do |dataset|
  json.data dataset[:data]
  json.borderColor dataset[:border_color]
  json.fill dataset[:fill]
end
