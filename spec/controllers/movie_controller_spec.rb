
 require 'spec_helper'
 
 describe MoviesController do
    before :each do
     @fake_movie = double('movie')
     @more_fake_movies = double('movies')
     allow(@fake_movie).to receive(:director) {'Some Name'}
     Movie.should_receive(:find).and_return(@fake_movie)
     allow(Movie).to receive(:same_director) {@more_fake_movies}
     
    end
     
     
     describe '#similar' do
        it 'gets the requested movie info available to the view' do
            post :similar, {:id => '1'}
            assigns(:movies).should eql(@more_fake_movies)
        end
        
        #Happy Path: movie has director info
        it 'calls the movie method that returns the movie with same director' do
            Movie.should_receive(:same_director).and_return(@more_fake_movies)
            post :similar, {:id => '1'}
        end
        
        it 'sets the similar movies info available to the view' do
            allow(Movie).to receive(:same_director) { @more_fake_movies }
            post :similar, {:id => '1'}
            assigns(:movies).should eql(@more_fake_movies)
        end
        
        #Sad Path: movie does not have director info
        it 'redirects to the movies index' do
            @fake_movie.should_receive(:director).and_return(nil)
            @fake_movie.should_receive(:title).and_return('Some title')
            post :similar, {:id => '1'}
            response.should redirect_to movies_path
        end
            
        it 'sets a notice telling the movie has no director info' do
            @fake_movie.should_receive(:director).and_return(nil)
            @fake_movie.should_receive(:title).and_return('Some title')
            post :similar, {:id => '1'}
           # notice = "'Some Title' has no director info"
            flash[:notice].should eql("'Some title' has no director info")
        end
    end
 end