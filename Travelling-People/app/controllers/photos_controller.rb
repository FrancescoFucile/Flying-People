class PhotosController < ApplicationController
  before_action :set_photo, only: [:show, :edit, :update, :destroy]

  # GET /photos
  # GET /photos.json
  def index
    @photos = Photo.all
  end

  # GET /photos/1
  # GET /photos/1.json
  def show
    set_photo
    @user_name = User.find(@photo.user_id).username
    @photo_comment = PhotoComment.new
  end

  # GET /photos/new
  def new
    @photo = Photo.new
  end

  # GET /photos/1/edit
  def edit
    if current_user.id != Photo.find(params[:id]).user_id
      redirect_to root_path
    end
  end

  # POST /photos
  # POST /photos.json
  def create
    @photo = Photo.new(photo_params)

    respond_to do |format|
      if @photo.save
        format.html { redirect_to @photo, notice: 'Photo was successfully created.' }
        format.json { render :show, status: :created, location: @photo }
      else
        format.html { render :new }
        format.json { render json: @photo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /photos/1
  # PATCH/PUT /photos/1.json
  def update
    respond_to do |format|
      if @photo.update(photo_params)
        format.html { redirect_to @photo, notice: 'Photo was successfully updated.' }
        format.json { render :show, status: :ok, location: @photo }
      else
        format.html { render :edit }
        format.json { render json: @photo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /photos/1
  # DELETE /photos/1.json
  def destroy
    @photo.destroy
    redirect_to root_path
  end

  def like
    @photo = Photo.find(params[:id])
    PhotoLike.find_or_create_by(photo_id: @photo.id, user_id: current_user.id)
    redirect_back fallback_location: root_path
  end

  def comment
    @photo_comment = PhotoComment.create(photo_comment_params)
    redirect_back fallback_location: root_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_photo
      @photo = Photo.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def photo_params
      params.require(:photo).permit(:title, :image, :description, :locality, :user_id)
    end

    def photo_comment_params
      params.require(:photo_comment).permit(:user_id, :photo_id, :content)
    end
end
