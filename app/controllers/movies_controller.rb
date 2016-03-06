class MoviesController < ApplicationController
  def index
    if params[:search] && params[:runtime_in_minutes]
      params[:search].empty? ? @movies = Movie.all : @movies = Movie.search("%#{params[:search]}%")
      if params[:runtime_in_minutes] == "1"
        q = 90
        @movies = @movies.runtime_less_than(q)
      elsif params[:runtime_in_minutes] == "2"
        q1 = 90
        q2 = 120
        @movies = @movies.runtime_between(q1,q2)
      elsif params[:runtime_in_minutes] == "3"
        q = 120
        @movies = @movies.runtime_more_than(q)
      else
        @movies
      end
    elsif params[:sort_by]
      if params[:sort_by] == "title"
        @movies = Movie.order(title: :asc)
      elsif params[:sort_by] == "duration"
        @movies = Movie.order(runtime_in_minutes: :asc)
      elsif params[:sort_by] == "director"
        @movies = Movie.order(director: :asc)
      elsif params[:sort_by] == "newest"
        @movies = Movie.order(release_date: :desc)
      end
    else
      @movies = Movie.all
    end
  end

  def show
    @movie = Movie.find(params[:id])
  end

  def new
    @movie = Movie.new
  end

  def edit
    @movie = Movie.find(params[:id])
  end

  def create
    @movie = Movie.new(movie_params)

    if @movie.save
      redirect_to movies_path, notice: "#{@movie.title} was submitted successfully!"
    else
      render :new
    end
  end

  def update
    @movie = Movie.find(params[:id])

    if @movie.update_attributes(movie_params)
      redirect_to movies_path(@movie)
    else
      render :edit
    end
  end

  def destroy
    @movie = Movie.find(params[:id])
    @movie.destroy
    redirect_to movies_path
  end

  private
    def movie_params
      params.require(:movie).permit(:title, :release_date, :director, :runtime_in_minutes, :description, :poster_image_url, :poster, :remove_poster)
    end
end
