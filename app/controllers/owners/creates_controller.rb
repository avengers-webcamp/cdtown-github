class Owners::CreatesController < ApplicationController

	before_action :correct_owner

	def new
        @label = Label.new
		@artist = Artist.new
		@genre = Genre.new
    end

    def correct_owner
    	if current_owner.nil?
    	    if user_signed_in?
    	        redirect_to root_path
    	    else
    	    	redirect_to new_user_session_path
    	    end
        end
    end
end
