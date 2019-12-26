class Users::CdsController < ApplicationController
    PER = 4


	def show
		@cd = Cd.find(params[:id])
		@artists = Artist.select("name")
		@genres = Genre.select("name")
		@labels = Label.select("name")
		@user_cd = UserCd.new
	end

	def index
		@all_ranks = Cd.find(Like.group(:cd_id).order('count(cd_id) desc').limit(4).pluck(:cd_id))
		@cds = Cd.all.order(created_at: :desc)
		@cds = Kaminari.paginate_array(@cds).page(params[:page]).per(PER)
		@user_cd = UserCd.new
		@genres = Genre.all
		@like = Like.new
		@new_cd = Cd.all.limit(4).order(created_at: :desc)
	end

	def genre
		@genre = Genre.find(params[:id])
		@cd = Cd.where(genre_id:@genre.id)
		@genres = Genre.all
		@user_cd = UserCd.new
    end

	def search
		@user_cd = UserCd.new
		@genres = Genre.all
		@like = Like.new
		@new_cd = Cd.all.limit(4).order(created_at: :desc)
		if params[:artist].present?
            @cds = Cd.joins(:artist).where('artists.name LIKE ?', "%#{params[:artist]}%").references(:artist)
        elsif params[:song].present?
        	songs = Song.where('songs.name LIKE ?', "%#{params[:song]}%").references(:song)
        	@cds = []
        	songs.each do |song|
        		@cds << song.disc.cd
        	end
        elsif params[:album].present?
            @cds = Cd.where('name LIKE ?', "%#{params[:album]}%")
        elsif params[:label].present?
        	@cds = Cd.joins(:label).where('labels.name LIKE ?', "%#{params[:label]}%").references(:label)
        else
            @cds = Cd.all
        end
	end


	private

    def cd_params
    params.require(:cd).permit(:name, :jacket_image, :status, :price, :artist_id, :released_at, :label_id, :genre_id, discs_attributes: [:id, :disc_count, :description, :done, :_destroy,
                                                         songs_attributes: [:id, :name, :order, :description, :_destroy]])
    end
end
