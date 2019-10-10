datasets = [{
  data: @budgeted_data,
  border_color: "#83BED3",
  background_color: @budget_colors,
  fill: false
}]

json.labels @budget_cats
json.datasets datasets do |dataset|
  json.data dataset[:data]
  json.borderColor dataset[:border_color]
  json.backgroundColor dataset[:background_color]
  json.fill dataset[:fill]
end
