class Owners::CreatesController < ApplicationController
	def new
        @label = Label.new
		@artist = Artist.new
		@genre = Genre.new
    end
end
