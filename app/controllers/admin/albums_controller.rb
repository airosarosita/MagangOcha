class Admin::AlbumsController < ApplicationController
  before_action :authenticate_user! # Ensure user is logged in
  before_action :authorize_admin # Ensure only admins can access these actions
  before_action :set_album, only: %i[ show edit update destroy ]

  # GET /albums or /albums.json
  def index
    @albums = Album.all
  end

  # GET /albums/1 or /albums/1.json
  def show
  end

  # GET /albums/new
  def new
    @album = Album.new
    @album.album_songs.build
  end

  # GET /albums/1/edit
  def edit
  end

  # POST /albums or /albums.json
  def create
    @album = Album.new(album_params)

    respond_to do |format|
      if @album.save
        format.html { redirect_to album_url(@album), notice: "Album was successfully created." }
        format.json { render :show, status: :created, location: @album }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @album.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /albums/1 or /albums/1.json
  def update
    respond_to do |format|
      if @album.update(album_params)
        format.html { redirect_to admin_album_url(@album), notice: "Album was successfully updated." }
        format.json { render :show, status: :ok, location: @album }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @album.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /albums/1 or /albums/1.json
  def destroy
    @album.album_songs.destroy_all
    @album.destroy!

    respond_to do |format|
      format.html { redirect_to admin_albums_url, notice: "Album was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_album
      @album = Album.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      flash[:alert] = "Album not found"
      redirect_to admin_albums_url
    end

    # Only allow a list of trusted parameters through.
    def album_params
      params.require(:album).permit(:title, :about, :release, :credit, song_ids: [])
    end
    
     # Ensure only admins can access these actions
     def authorize_admin
      unless current_user&.admin?
        redirect_to root_path, alert: "You are not authorized to perform this action."
      end
    end
end