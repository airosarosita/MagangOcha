class Client::ArtistsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_artist, only: [:show, :edit, :update, :destroy]
  before_action :authorize_client, only: [:edit, :update, :destroy]

  # GET /artists or /artists.json
  def index
    @artists = Artist.all
  end

  # GET /aclient/artists/1 or /artists/1.json
  def show
  end

  # GET /client/artists/new
  def new
    @artist = Artist.new
  end

  # GET /client/artists/1/edit
  def edit
  end

   # POST /client/artists or /client/artists.json
   def create
    @artist = Artist.new(artist_params)

    respond_to do |format|
      if @artist.save
        format.html { redirect_to client_artist_url(@artist), notice: "Artist was successfully created." }
        format.json { render :show, status: :created, location: @artist }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @artist.errors, status: :unprocessable_entity }
      end
    end
  end

   # PATCH/PUT /client/artists/1 or /client/artists/1.json
   def update
    respond_to do |format|
      if @artist.update(artist_params)
        format.html { redirect_to client_artist_url(@artist), notice: "Artist was successfully updated." }
        format.json { render :show, status: :ok, location: @artist }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @artist.errors, status: :unprocessable_entity }
      end
    end
  end

   # DELETE /client/artists/1 or /client/artists/1.json
   def destroy
    @artist.destroy!

    respond_to do |format|
      format.html { redirect_to client_artists_url, notice: "Artist was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_artist
      @artist = Artist.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def artist_params
      params.require(:artist).permit(:name, :year, :biography, :nationality)
    end
end
