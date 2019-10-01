class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :accounts
  has_many :categories
  after_save :create_categories


  private

  def create_categories
    if categories.count.zero?
      Category.create(user: self, name: 'Groceries', icon: (Icon.find_by(name: 'Groceries')), color: '#97C05C')
      Category.create(user: self, name: 'Food & Drinks', icon: (Icon.find_by(name: 'Food & Drinks')), color: '#4054AF')
      Category.create(user: self, name: 'Travel', icon: (Icon.find_by(name: 'Travel')), color: '#ED6237')
      Category.create(user: self, name: 'Rent & Loans', icon: (Icon.find_by(name: 'Rent & Loans')), color: '#9E51B6')
      Category.create(user: self, name: 'Sports & Activities', icon: (Icon.find_by(name: 'Sports & Activities')), color: '#414141')
      Category.create(user: self, name: 'Transport', icon: (Icon.find_by(name: 'Transport')), color: '#37818D')
      Category.create(user: self, name: 'Savings', icon: (Icon.find_by(name: 'Savings')), color: '#419388')
      Category.create(user: self, name: 'Clothing', icon: (Icon.find_by(name: 'Clothing')), color: '#9E9E9E')
      Category.create(user: self, name: 'Bills & Fees', icon: (Icon.find_by(name: 'Bills & Fees')), color: '#67DA21')
      Category.create(user: self, name: 'Gifts', icon: (Icon.find_by(name: 'Gifts')), color: '#657C89')
      Category.create(user: self, name: 'Entertainment', icon: (Icon.find_by(name: 'Entertainment')), color: '#775CBC')
      Category.create(user: self, name: 'Hygiene & Beauty', icon: (Icon.find_by(name: 'Hygiene & Beauty')), color: '#735549')
      Category.create(user: self, name: 'Home & Interior', icon: (Icon.find_by(name: 'Home & Interior')), color: '#F19B38')
      Category.create(user: self, name: 'Gadgets', icon: (Icon.find_by(name: 'Gadgets')), color: '#DA5079')
      Category.create(user: self, name: 'No Category', icon: (Icon.find_by(name: 'No Category')), color: '#DA2121')
    end
  end
end
