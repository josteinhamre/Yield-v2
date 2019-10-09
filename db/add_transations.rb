require "open-uri"
require 'csv'

user = User.last
account = user.accounts.last

file2 = 'db/custom_seed.csv'
csv = CSV.foreach(file2, headers: true, col_sep: ';') do |row|
  if row[1].match?(/(Varekjøp)(.*)(Dato .*)/)
    match = row[1].match(/(Varekjøp)(.*)(Dato .*)/)
    trans = Transaction.new
    trans.info = match[2].strip
    trans.datetime = Time.strptime(row[0][6, 9] + '.' + match[3][5, 15], "%Y.%d.%m kl. %H.%M")
    trans.account = account
    trans.csv_row_id = row
    trans.category = user.no_cat
    row[3] == "" ? trans.amount = row[4] : trans.amount = "-#{row[3]}"
    trans.approved_at = Time.now
    p trans
    trans.save
    p trans
  end
end
