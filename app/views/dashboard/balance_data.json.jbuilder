datasets = [{
  data: @balance_data,
  border_color: "#83BED3",
  fill: false
}]

json.labels (1..@balance_data.count).to_a
json.datasets datasets do |dataset|
  json.data dataset[:data]
  json.borderColor dataset[:border_color]
  json.fill dataset[:fill]
end
