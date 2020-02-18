class Admins::GenresController < ApplicationController
before_action :authenticate_admin!
  def index
  	@genre=Genre.new
  	@genres=Genre.all
  end

  def create
  	@genre=Genre.new(genre_params)
  	if @genre.save
  	 redirect_to admins_genres_path, notice: 'ジャンルが追加されました。'
    else
      redirect_to admins_genres_path, notice: '空欄があります。'
    end
  end

  def edit
  	@genre=Genre.find(params[:id])
  end

  def update
  	@genre=Genre.find(params[:id])
    if @genre.update(genre_params)
     redirect_to admins_genres_path, notice: 'ジャンルが編集されました。'
    else
      redirect_to edit_admins_genre_path, notice: '空欄があります。'
    end
  end


  private
  def genre_params
  	params.require(:genre).permit(:name,:status)
  end
end
