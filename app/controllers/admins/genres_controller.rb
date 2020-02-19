class Admins::GenresController < ApplicationController
before_action :authenticate_admin!
  def index
  	@genre=Genre.new
  	@genres=Genre.all
  end

  def create
  	@genre=Genre.new(genre_params)
  	if @genre.save
      @genre.update(genre_params)
      flash[:genre_success] = "ジャンルが追加されました。"
  	 redirect_to admins_genres_path
    else
      flash[:genre_error] = "空欄があります。"
      redirect_to admins_genres_path
    end
  end

  def edit
  	@genre=Genre.find(params[:id])
  end

  def update
  	@genre=Genre.find(params[:id])
    if @genre.update(genre_params)
      flash[:genre_success] = "ジャンルが編集されました。"
     redirect_to admins_genres_path
    else
      flash[:genre_error] = "空欄があります。"
      redirect_to edit_admins_genre_path
    end
  end


  private
  def genre_params
  	params.require(:genre).permit(:name,:status)
  end
end
