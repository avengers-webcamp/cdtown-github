class Owners::CreatesController < ApplicationController
	def new
        @label = Label.new
		@artist = Artist.new
		@genre = Genre.new
		render "owners/create"
    end
end
