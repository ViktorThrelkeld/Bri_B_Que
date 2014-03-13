class Recipe < ActiveRecord::Base
  before_save :titleize_title
  belongs_to :user
  has_many :recipeingredients, dependent: :destroy
  has_many :ingredients, :through => :recipeingredients
  accepts_nested_attributes_for :ingredients #:reject_if => :all_blank#, :reject_if => lambda { |a| a[:content].blank?  }#, :allow_destroy => true
  accepts_nested_attributes_for :recipeingredients, allow_destroy: true

  scope :sort_by_title, -> {self.order("title ASC")}

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

  def titleize_title
    self.title = self.title.titleize
  end
end