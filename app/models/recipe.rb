class Recipe < ActiveRecord::Base
  belongs_to :user
  has_many :recipeingredients, dependent: :destroy
  has_many :ingredients, :through => :recipeingredients
  accepts_nested_attributes_for :ingredients #:reject_if => :all_blank#, :reject_if => lambda { |a| a[:content].blank?  }#, :allow_destroy => true
  accepts_nested_attributes_for :recipeingredients, allow_destroy: true

  def self.random
    @recipe = Recipe.offset(rand(Recipe.count)).first
  end

  def self.search(search)
    if search
      recipes = Recipe.find(:all, :conditions => ['title LIKE ?', "%#{search}%"])
    else
      find(:all)
    end
  end
end