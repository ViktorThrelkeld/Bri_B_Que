class Recipe < ActiveRecord::Base
  belongs_to :user
  has_many :recipeingredients, dependent: :destroy
  has_many :ingredients, :through => :recipeingredients
  accepts_nested_attributes_for :ingredients #:reject_if => :all_blank#, :reject_if => lambda { |a| a[:content].blank?  }#, :allow_destroy => true
  accepts_nested_attributes_for :recipeingredients

  def self.search(search)
    if search
      find(:all, :conditions => ['title LIKE ?', "%#{search}%"])
      # find(:all, :conditions => ['title LIKE ? OR description LIKE ?', search_condition, search_condition])
    else
      find(:all)
    end
  end
end
