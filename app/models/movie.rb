class Movie < ActiveRecord::Base

  attr_accessible :title, :rating, :director, :description, :release_date

  def self.all_ratings
    %w(G PG PG-13 NC-17 R)
  end
  
  def self.same_director(director)
    self.where({:director => director})
  end
end

