require 'csv'


class Api::V1::MoviesController < ApplicationController
  skip_before_action :verify_authenticity_token

  def import_csv
    filepath = Rails.root.join('app', 'data', 'netflix_titles.csv')
    CSV.foreach(filepath, headers: :first_row) do |row|
      new_movie = Movie.new(
        show_id: row['show_id'],
        title: row['title'],
        genre: row['type'],
        year: row['date_added'],
        country: row['country'],
        published_at: row['release_year'],
        description: row['description'],
        director: row['director'],
        cast: row['cast'],
        rating: row['rating'],
        duration: row['duration'],
        listed_in: row['listed_in']
      )
      new_movie.save if Movie.where(show_id: new_movie.show_id).empty?
    end
    puts 'Requisição feita com sucesso.'
  end

  def get_movies
    @movies = Movie.all.where("#{params[:type]}": params[:value]).order(published_at: :asc)
    @movies = Movie.all.order(published_at: :asc) if params[:type] == 'all' && params[:value] == 'movies'
    render json: format_response(@movies)
  end

  private

  def format_response(movies)
    movies.map do |movie|
      {
        id: movie.id,
        title: movie.title,
        genre: movie.genre,
        year: movie.year,
        country: movie.country,
        published_at: movie.published_at,
        description: movie.description
      }
    end
  end
end
