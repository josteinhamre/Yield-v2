class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :accounts
  has_many :categories
  has_many :budgets, through: :categories
  has_many :transactions, through: :accounts
  after_save :create_categories

  private

  def create_categories
    if categories.count.zero?
      .Category.create(user: self, name: 'Groceries', icon: (Icon.find_by(name: 'Groceries')), color: '#3090C7')
      .Category.create(user: self, name: 'Food & Drinks', icon: (Icon.find_by(name: 'Food & Drinks')), color: '#3090C7')
      .Category.create(user: self, name: 'Clothing', icon: (Icon.find_by(name: 'Clothing')), color: '#3090C7')
      .Category.create(user: self, name: 'Home & Interior', icon: (Icon.find_by(name: 'Home & Interior')), color: '#3090C7')
      . Category.create(user: self, name: 'Sports & Activities', icon: (Icon.find_by(name: 'Sports & Activities')), color: '#54C571')
      . Category.create(user: self, name: 'Hygiene & Beauty', icon: (Icon.find_by(name: 'Hygiene & Beauty')), color: '#F778A1')
      .Category.create(user: self, name: 'Gadgets', icon: (Icon.find_by(name: 'Gadgets')), color: '#64E986')
      .Category.create(user: self, name: 'Entertainment', icon: (Icon.find_by(name: 'Entertainment')), color: '#6AFB92')
      .Category.create(user: self, name: 'Bills & Fees', icon: (Icon.find_by(name: 'Bills & Fees')), color: '#FFE87C')
      .Category.create(user: self, name: 'Rent & Loans', icon: (Icon.find_by(name: 'Rent & Loans')), color: '#FFA62F')
      .Category.create(user: self, name: 'Transport', icon: (Icon.find_by(name: 'Transport')), color: '#FFCBA4')
      .Category.create(user: self, name: 'Gifts', icon: (Icon.find_by(name: 'Gifts')), color: '#FF7F50')
      Category.create(user: self, name: 'Savings', icon: (Icon.find_by(name: 'Savings')), color: '#9E7BFF')
      Category.create(user: self, name: 'Travel', icon: (Icon.find_by(name: 'Travel')), color: '#D462FF')
      Category.create(user: self, name: 'Income', icon: (Icon.find_by(name: 'Income')), color: '#FFF380')
      Category.create(user: self, name: 'No Category', icon: (Icon.find_by(name: 'No Category')), color: 'transparent')
    end
  end
end
