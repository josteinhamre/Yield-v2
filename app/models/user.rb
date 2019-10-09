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
      Category.create(user: self, name: 'Groceries', icon: (Icon.find_by(name: 'Groceries')), color: '#55efc4')
      Category.create(user: self, name: 'Food & Drinks', icon: (Icon.find_by(name: 'Food & Drinks')), color: '#00b894')
      Category.create(user: self, name: 'Clothing', icon: (Icon.find_by(name: 'Clothing')), color: '#ffeaa7')
      Category.create(user: self, name: 'Home & Interior', icon: (Icon.find_by(name: 'Home & Interior')), color: '#fdcb6e')
      Category.create(user: self, name: 'Sports & Activities', icon: (Icon.find_by(name: 'Sports & Activities')), color: '#fd79a8')
      Category.create(user: self, name: 'Hygiene & Beauty', icon: (Icon.find_by(name: 'Hygiene & Beauty')), color: '#FDA7DF')
      Category.create(user: self, name: 'Gadgets', icon: (Icon.find_by(name: 'Gadgets')), color: '#fab1a0')
      Category.create(user: self, name: 'Entertainment', icon: (Icon.find_by(name: 'Entertainment')), color: '#00cec9')
      Category.create(user: self, name: 'Bills & Fees', icon: (Icon.find_by(name: 'Bills & Fees')), color: '#81ecec')
      Category.create(user: self, name: 'Rent & Loans', icon: (Icon.find_by(name: 'Rent & Loans')), color: '#74b9ff')
      Category.create(user: self, name: 'Transport', icon: (Icon.find_by(name: 'Transport')), color: '#0984e3')
      Category.create(user: self, name: 'Gifts', icon: (Icon.find_by(name: 'Gifts')), color: '#ff7675')
      Category.create(user: self, name: 'Savings', icon: (Icon.find_by(name: 'Savings')), color: '#e84393')
      Category.create(user: self, name: 'Travel', icon: (Icon.find_by(name: 'Travel')), color: '#a29bfe')
      Category.create(user: self, name: 'Income', icon: (Icon.find_by(name: 'Income')), color: '#6c5ce7')
      Category.create(user: self, name: 'No Category', icon: (Icon.find_by(name: 'No Category')), color: 'transparent')
    end
  end
end
