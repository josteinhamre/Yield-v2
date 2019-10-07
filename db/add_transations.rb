require "open-uri"
require 'csv'

user = User.last
account = user.accounts.last

file2 = 'db/custom_seed.csv'
csv = CSV.foreach(file2, headers: true, col_sep: ';') do |row|
  if row[1].match?(/(Varekjøp)(.*)(Dato .*)/)
    match = row[1].match(/(Varekjøp)(.*)(Dato .*)/)
    trans = Transaction.new
    trans.store = match[2].strip
    trans.datetime = Time.strptime(row[0][6, 9] + '.' + match[3][5, 15], "%Y.%d.%m kl. %H.%M")
    trans.account = account
    trans.category = user.categories.find_by(name: 'No Category')
    if row[3] == ""
      trans.amount = row[4]
    else
      trans.amount = "-#{row[3]}"
    end
    p trans
    trans.save!
  end
end
