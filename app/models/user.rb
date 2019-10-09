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
      Category.create(user: self, name: 'Groceries', icon: (Icon.find_by(name: 'Groceries')), color: '#C4E538')
      Category.create(user: self, name: 'Food & Drinks', icon: (Icon.find_by(name: 'Food & Drinks')), color: '#12CBC4')
      Category.create(user: self, name: 'Clothing', icon: (Icon.find_by(name: 'Clothing')), color: '#FFC312')
      Category.create(user: self, name: 'Home & Interior', icon: (Icon.find_by(name: 'Home & Interior')), color: '#F79F1F')
      Category.create(user: self, name: 'Sports & Activities', icon: (Icon.find_by(name: 'Sports & Activities')), color: '#1289A7')
      Category.create(user: self, name: 'Hygiene & Beauty', icon: (Icon.find_by(name: 'Hygiene & Beauty')), color: '#FDA7DF')
      Category.create(user: self, name: 'Gadgets', icon: (Icon.find_by(name: 'Gadgets')), color: '#ED4C67')
      Category.create(user: self, name: 'Entertainment', icon: (Icon.find_by(name: 'Entertainment')), color: '#B53471')
      Category.create(user: self, name: 'Bills & Fees', icon: (Icon.find_by(name: 'Bills & Fees')), color: '#9980FA')
      Category.create(user: self, name: 'Rent & Loans', icon: (Icon.find_by(name: 'Rent & Loans')), color: '#0652DD')
      Category.create(user: self, name: 'Transport', icon: (Icon.find_by(name: 'Transport')), color: '#EE5A24')
      Category.create(user: self, name: 'Gifts', icon: (Icon.find_by(name: 'Gifts')), color: '#833471')
      Category.create(user: self, name: 'Savings', icon: (Icon.find_by(name: 'Savings')), color: '#009432')
      Category.create(user: self, name: 'Travel', icon: (Icon.find_by(name: 'Travel')), color: '#FDA7DF')
      Category.create(user: self, name: 'Income', icon: (Icon.find_by(name: 'Income')), color: '#fab1a0')
      Category.create(user: self, name: 'No Category', icon: (Icon.find_by(name: 'No Category')), color: 'transparent')
    end
  end
end
