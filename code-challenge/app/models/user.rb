class User < ActiveRecord::Base
  has_many :reviews
  has_many :products, through: :reviews
end

class User < ApplicationRecord
  has_many :reviews
  has_many :products, through: :reviews

  def favorite_product
    # Find the product with the highest star_rating among the user's reviews
    reviews.order(star_rating: :desc).first.product
  end

  def remove_reviews(product)
    # Delete all reviews of the user for the specified product
    reviews.where(product: product).destroy_all
  end
end
