class MoviesController < ApplicationController
  def index
    if params[:runtime_in_minutes] && (params[:runtime_in_minutes].empty? == false)
      if params[:runtime_in_minutes] == "1"
        q = 90
        @movies = Movie.where("runtime_in_minutes < ?", q)
      elsif params[:runtime_in_minutes] == "2"
        q1 = 90
        q2 = 120
        @movies = Movie.where("runtime_in_minutes >= ? and runtime_in_minutes <= ?", q1, q2)
      else
        q = 120
        @movies = Movie.where("runtime_in_minutes > ?", q)
      end
    elsif params[:title] || params[:director]
      params[:title].empty? ? q1 = nil : q1 = "%#{params[:title]}%"
      params[:director].empty? ? q2 = nil : q2 = "%#{params[:director]}%"
      @movies = Movie.where("title like ? or director like ?", q1, q2)
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
