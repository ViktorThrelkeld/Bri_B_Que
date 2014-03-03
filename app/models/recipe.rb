class Recipe < ActiveRecord::Base
  belongs_to :user
  has_many :recipeingredients, dependent: :destroy
  has_many :ingredients, :through => :recipeingredients
  accepts_nested_attributes_for :ingredients #:reject_if => :all_blank#, :reject_if => lambda { |a| a[:content].blank?  }#, :allow_destroy => true
  accepts_nested_attributes_for :recipeingredients
end
