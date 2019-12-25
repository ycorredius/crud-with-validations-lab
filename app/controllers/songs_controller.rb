class SongsController < ApplicationController
    def index
        @songs = Song.all
    end
    
    def show
        @song = Song.find(params[:id])
    end
    
    def edit
        @song = Song.find(params[:id])
        if @song
            render :edit
        end
    end
    
    def create
        @song = Song.new(post_params)
        if @song.valid?
            @song.save
            redirect_to song_path(@song)
        else
            render :new
        end
    end


    private
    def post_params
        params.permit(:title,:released,:release_year,:genre,:artist_name)
    end
end
