class Product < ActiveRecord::Base
  has_many :reviews
  has_many :users, through: :reviews
end

class Product < ApplicationRecord
  has_many :reviews
  has_many :users, through: :reviews

  def leave_review(user, star_rating, comment)
    # Create a new review associated with this product and the user
    Review.create(user: user, product: self, star_rating: star_rating, comment: comment)
  end

  def print_all_reviews
    # Print all reviews for this product
    reviews.each do |review|
      review.print_review
    end
  end

  def average_rating
    # Calculate the average star rating for this product
    total_ratings = reviews.sum(:star_rating)
    total_reviews = reviews.count
    return total_ratings.to_f / total_reviews if total_reviews.positive?

    0.0
  end
end
