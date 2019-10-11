require "open-uri"
require 'csv'

if Icon.count.zero?
  Icon.create(name: 'Groceries', photo: 'yield-resources/icons/groceries_u6b5hp.png')
  Icon.create(name: 'Food & Drinks', photo: 'yield-resources/icons/food_yrgvtw.png')
  Icon.create(name: 'Travel', photo: 'yield-resources/icons/travel_vzwdxf.png')
  Icon.create(name: 'Rent & Loans', photo: 'yield-resources/icons/loan_ty1uqj.png')
  Icon.create(name: 'Sports & Activities', photo: 'yield-resources/icons/sports_l2z7kv.png')
  Icon.create(name: 'Transport', photo: 'yield-resources/icons/transport_xdgszi.png')
  Icon.create(name: 'Savings', photo: 'yield-resources/icons/saving_kz7jxw.png')
  Icon.create(name: 'Clothing', photo: 'yield-resources/icons/shirt_xpc9x6.png')
  Icon.create(name: 'Bills & Fees', photo: 'yield-resources/icons/bills_chkytz.png')
  Icon.create(name: 'Gifts', photo: 'yield-resources/icons/gifts_tk6zlw.png')
  Icon.create(name: 'Entertainment', photo: 'yield-resources/icons/entertainment_hqjy7b.png')
  Icon.create(name: 'Hygiene & Beauty', photo: 'yield-resources/icons/beauty_gxftvd.png')
  Icon.create(name: 'Home & Interior', photo: 'yield-resources/icons/home_gzvxtt.png')
  Icon.create(name: 'Gadgets', photo: 'yield-resources/icons/gadgets_c2c9yg.png')
  Icon.create(name: 'Income', photo: 'yield-resources/icons/income_iuru1x.png')
  Icon.create(name: 'No Category', photo: 'yield-resources/icons/no-cat-qmb_npqck7.png')
  Icon.create(name: 'Flower', photo: 'yield-resources/icons/flower_yfb5cd.png')
  Icon.create(name: 'Dentist', photo: 'yield-resources/icons/dentist_hqrdbi.png')
  Icon.create(name: 'Mobile Payment', photo: 'yield-resources/icons/mobile-payment_jpdrhf.png')
  Icon.create(name: 'Guitar', photo: 'yield-resources/icons/guitar_fdikzs.png')
  Icon.create(name: 'Robot', photo: 'yield-resources/icons/robot_syyehn.png')
  Icon.create(name: 'Pencil', photo: 'yield-resources/icons/pencil_wkigvr.png')
  Icon.create(name: 'Boat', photo: 'yield-resources/icons/boat_xfdxrg.png')
  Icon.create(name: 'Heart', photo: 'yield-resources/icons/heart_a3flwj.png')
  Icon.create(name: 'Books', photo: 'yield-resources/icons/books_xz9pxe.png')
  Icon.create(name: 'Fish bowl', photo: 'yield-resources/icons/fish-bowl_ydk9sl.png')
  Icon.create(name: 'Plant in hand', photo: 'yield-resources/icons/grow_ioy1vt.png')
  Icon.create(name: 'Like', photo: 'yield-resources/icons/like_hyj69g.png')
  Icon.create(name: 'Monster', photo: 'yield-resources/icons/monster_f4exdf.png')
  Icon.create(name: 'Delivery', photo: 'yield-resources/icons/delivery_g5zfnf.png')
  Icon.create(name: 'Car', photo: 'yield-resources/icons/car_yltlq8.png')
  Icon.create(name: 'Desk', photo: 'yield-resources/icons/desk_qctvj7.png')
  Icon.create(name: 'Cup', photo: 'yield-resources/icons/cup_ixtnpw.png')
  Icon.create(name: 'Lamp', photo: 'yield-resources/icons/lamp_rprql6.png')
  Icon.create(name: 'Sofa', photo: 'yield-resources/icons/sofa_nzipme.png')
  Icon.create(name: 'Bag', photo: 'yield-resources/icons/bag_t1jcjr.png')
end

user = User.new
users = User.count + 1
user.email = "test#{users}@yield.no"
user.password = 'password'
user.first_name = 'Agnieszka'
user.last_name = 'Stec'
user.photo = 'n34ytdjiyn4zr5wll6fp.jpg'
user.save!
account = Account.new
account.name = 'Main account'
account.user = user
account.number = 70661531379
account.bank = 'DNB'
account.balance = "35000"
account.save!

CATEGORIES = ['Groceries', 'Food & Drinks', 'Travel', 'Rent & Loans', 'Sports & Activities',
 'Transport', 'Savings', 'Clothing', 'Bills & Fees', 'Gifts', 'Entertainment',
  'Hygiene & Beauty', 'Home & Interior', 'Gadgets',]
AUGUST = [3798, 4800, 1000, 10000, 1800, 1500, 1000, 2600, 1100, 1500, 1800, 1620, 3900, 700]
SEPTEMBER = [4000, 5000, 0, 10000, 1000, 5500, 0, 1000, 2000, 615, 800, 700, 600, 500]
OCTOBER = [3500, 3500, 618, 10000, 600, 2000, 200, 1000, 1500, 600, 800, 800, 1800, 500]

CATEGORIES.each_with_index do |cat, i|
bud = Budget.new
bud.category = user.categories.find_by(name: cat)
bud.amount = AUGUST[(i)]
bud.month_from = Date.parse("2019-08-01")
p bud
bud.save!
end

CATEGORIES.each_with_index do |cat, i|
bud = Budget.new
bud.category = user.categories.find_by(name: cat)
bud.amount = SEPTEMBER[(i)]
bud.month_from = Date.parse("2019-09-01")
p bud
bud.save!
end

CATEGORIES.each_with_index do |cat, i|
bud = Budget.new
bud.category = user.categories.find_by(name: cat)
bud.amount = OCTOBER[(i)]
bud.month_from = Date.parse("2019-10-01")
p bud
bud.save!
end


# # DNB
# file = 'db/seed_helper.csv'
# csv = CSV.foreach(file, headers: true, col_sep: ';') do |row|
#   if row[1].match?(/(Varekjøp)(.*)(Dato .*)/)
#     match = row[1].match(/(Varekjøp)(.*)(Dato .*)/)
#     trans = Transaction.new
#     trans.info = match[2].strip
#     trans.datetime = Time.strptime(row[0][6, 9] + '.' + match[3][5, 15], "%Y.%d.%m kl. %H.%M")
#     trans.account = account
#     trans.category = user.categories.find_by(name: row[5])
#     trans.csv_row_id = row
#     row[3] == "" ? trans.amount = row[4] : trans.amount = "-#{row[3]}"
#     trans.approved_at = Time.now
#     p trans
#     trans.save!
#   elsif row[1].match?(/(Visa|Lån|Kontoregulering|Overføring)\s*(\d*)(.*)/)
#     match = row[1].match(/(Visa|Lån|Kontoregulering|Overføring)\s*(\d*)(.*)/)
#     trans = Transaction.new
#     trans.info = "#{match[1].strip} - #{match[3].strip}"
#     trans.datetime = Time.strptime("#{row[0]}.12.00", "%d.%m.%Y.%H.%M")
#     trans.account = account
#     trans.category = user.categories.find_by(name: row[5])
#     trans.csv_row_id = row
#     row[3] == "" ? trans.amount = row[4] : trans.amount = "-#{row[3]}"
#     trans.approved_at = Time.now
#     p trans
#     trans.save!
#   elsif row[1].match?(/Reservert/)
#     puts "Waiting to parse #{row[1]}, missing full information"
#   else
#     puts "Unable to parse #{row[1]}"
#   end
# end

# Skandiabanken
file = 'db/new_seed_helper.csv'
csv = CSV.foreach(file, headers: true, col_sep: ';') do |row|
if row[4] == 'Visa' || row[4] == 'Visa'
    match = row[5].match(/(.\d{4} )(\d*.\d*) (\w* \d*.\d* )(.*)(Kurs.*)/)
    trans = Transaction.new
    trans.info = match[4].strip
    trans.datetime = Time.strptime("#{match[2]}.#{row[0][0, 4]}.12.00", "%d.%m.%Y.%H.%M")
    trans.account = account
    trans.category = user.categories.find_by(name: row[8])
    # trans.category = user.no_cat
    trans.csv_row_id = row
    row[6].nil? ? trans.amount = row[7] : trans.amount = "-#{row[6]}"
    trans.approved_at = Time.now
    p trans
    trans.save!
  elsif row[4].match?(/Varekjøp/)
    match = row[5].match(/(\d*.\d*)(.*)/)
     trans = Transaction.new
    trans.info = match[2].strip
    trans.datetime = Time.strptime("#{match[1]}.#{row[0][0, 4]}.12.00", "%d.%m.%Y.%H.%M")
    trans.account = account
    trans.category = user.categories.find_by(name: row[8])
    # trans.category = user.no_cat
    trans.csv_row_id = row
    row[6].nil? ? trans.amount = row[7] : trans.amount = "-#{row[6]}"
    trans.approved_at = Time.now
    p trans
    trans.save!
  elsif row[5].match?(/(.*)(Betalt:.*)(\d{2}.\d{2}.\d{2})/)
    match = row[5].match(/(.*)(Betalt:.*)(\d{2}.\d{2}.\d{2})/)
    trans = Transaction.new
    trans.info = match[1].strip
    trans.datetime = Time.strptime("#{match[3]}.12.00", "%d.%m.%y.%H.%M")
    trans.account = account
    trans.category = user.categories.find_by(name: row[8])
    # trans.category = user.no_cat
    trans.csv_row_id = row
    row[6].nil? ? trans.amount = row[7] : trans.amount = "-#{row[6]}"
    trans.approved_at = Time.now
    p trans
    trans.save!
  else
    trans = Transaction.new
    trans.info = row[5]
    trans.datetime = Time.strptime("#{row[1]}.12.00", "%Y-%m-%d.%H.%M")
    trans.account = account
    trans.category = user.categories.find_by(name: row[8])
    # trans.category = user.no_cat
    trans.csv_row_id = row
    row[6].nil? ? trans.amount = row[7] : trans.amount = "-#{row[6]}"
    trans.approved_at = Time.now
    p trans
    trans.save!
  end
end

# file2 = 'db/custom_seed.csv'
# csv = CSV.foreach(file2, headers: true, col_sep: ';') do |row|
#   if row[1].match?(/(Varekjøp)(.*)(Dato .*)/)
#     match = row[1].match(/(Varekjøp)(.*)(Dato .*)/)
#     trans = Transaction.new
#     trans.info = match[2].strip
#     trans.datetime = Time.strptime(row[0][6, 9] + '.' + match[3][5, 15], "%Y.%d.%m kl. %H.%M")
#     trans.account = account
#     trans.category = user.no_cat
#     trans.csv_row_id = row
#     row[3] == "" ? trans.amount = row[4] : trans.amount = "-#{row[3]}"
#     p trans
#     trans.save!
#     trans
#   end
# end
