class SongsController < ApplicationController
    def index
        @songs = Song.all
    end
    def new
        @song = Song.new
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

    def update
        @song = Song.find(params[:id])
        if @song.update(post_params)
            redirect_to song_path(@song)
        else 
            render :edit
        end
    end

    def destroy
        @song = Song.find(params[:id])
        @song.destroy
        redirect_to songs_url

    end
    private
    def post_params
        params.require(:song).permit(:title,:released,:release_year,:genre,:artist_name)
    end
end
