datasets = [{
  data: @chart_spent_per_day,
  border_color: "#F56692",
  background_color: "rgba(245, 102, 146, .3)",
  fill: true
}]

json.labels (1..@chart_spent_per_day.count).to_a
json.datasets datasets do |dataset|
  json.data dataset[:data]
  json.borderColor dataset[:border_color]
  json.backgroundColor dataset[:background_color]
  json.fill dataset[:fill]
end
