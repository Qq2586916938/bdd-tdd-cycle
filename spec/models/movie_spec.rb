
 require 'spec_helper'
 
 describe Movie do
     it 'has a method called same_director' do
         Movie.should respond_to(:same_director)
     end
         
     describe 'self.same_director' do
         it 'receives the director of a movie as param' do
             Movie.should respond_to(:same_director).with(1)
         end
         
         it 'returns the movies that have the same director' do
          3.times do
           Movie.create({
            title: '', rating: '', director: 'George Lucas', release_date: '' 
            })
          end
           Movie.create({
            title: '', rating: '', director: 'Ridley Scott', release_date: '' 
           })
         
           movies = Movie.same_director('George Lucas')
           movies.should have(3).things
         
        end
     end
 end
 
