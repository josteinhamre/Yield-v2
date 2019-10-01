require "open-uri"
require 'csv'

# Icon.create(name: 'Groceries', photo: 'yield-resources/icons/groceries_u6b5hp.png')
# Icon.create(name: 'Food & Drinks', photo: 'yield-resources/icons/food_yrgvtw.png')
# Icon.create(name: 'Travel', photo: 'yield-resources/icons/travel_vzwdxf.png')
# Icon.create(name: 'Rent & Loans', photo: 'yield-resources/icons/loan_ty1uqj.png')
# Icon.create(name: 'Sports & Activities', photo: 'yield-resources/icons/sports_l2z7kv.png')
# Icon.create(name: 'Transport', photo: 'yield-resources/icons/transport_xdgszi.png')
# Icon.create(name: 'Savings', photo: 'yield-resources/icons/saving_kz7jxw.png')
# Icon.create(name: 'Clothing', photo: 'yield-resources/icons/shirt_xpc9x6.png')
# Icon.create(name: 'Bills & Fees', photo: 'yield-resources/icons/bills_chkytz.png')
# Icon.create(name: 'Gifts', photo: 'yield-resources/icons/gifts_tk6zlw.png')
# Icon.create(name: 'Entertainment', photo: 'yield-resources/icons/entertainment_hqjy7b.png')
# Icon.create(name: 'Hygiene & Beauty', photo: 'yield-resources/icons/beauty_gxftvd.png')
# Icon.create(name: 'Home & Interior', photo: 'yield-resources/icons/home_gzvxtt.png')
# Icon.create(name: 'Gadgets', photo: 'yield-resources/icons/gadgets_c2c9yg.png')
# Icon.create(name: 'No Category', photo: 'yield-resources/icons/no-cat_uw0jzy.png')




# user = User.new
# user.email = 'test@yield.no'
# user.password = 'password'
# user.first_name = 'Agnieszka'
# user.last_name = 'Stec'

# account = Account.new
# account.name = 'Main account'
# account.user = user
# account.number = 70661531379
# account.bank = 'DNB'





file = 'seed_helper.csv'
csv = CSV.foreach(file, headers: true, col_sep: ';') do |row|
  if row[1].match?(/(Varekjøp)(.*)(Dato .*)/)
    match = row[1].match(/(Varekjøp)(.*)(Dato .*)/)
    puts match[2]
  elsif row[1].match?(/(Visa|Lån|Kontoregulering|Overføring)\s*(\d*)(.*)/)
    match = row[1].match(/(Visa|Lån|Kontoregulering|Overføring)\s*(\d*)(.*)/)
    puts "#{match[1]} - #{match[3]}"
  end
end
