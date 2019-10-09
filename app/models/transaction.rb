class Transaction < ApplicationRecord
  belongs_to :account
  belongs_to :category
  monetize :amount_cents
  has_one :user, through: :account
  after_save :auto_categorize

  def auto_categorize
    return unless category.name == 'No Category'
    require 'string/similarity'
    cat_collection = []
    user.transactions.each do |trans|
      value = String::Similarity.levenshtein_distance(store[0, 15], trans.store[0, 15])
      cat_collection << trans.category if value < 11
    end
    counts = Hash.new(0)
    cat_collection.each { |name| counts[name] += 1 }
    self.category = counts.max_by{|key, value| value}.first
    save if self.category.name != 'No Category'
    self.category.name
  end
end


# t = Transaction.last
# t.auto_categorize
