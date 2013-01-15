class Web::Admin::PhotoAlbumsController < Web::Admin::ApplicationController
  def index
    @q = PhotoAlbum.ransack params[:q]
    @photo_albums = @q.result.page(params[:page])
  end

  def new
    @photo_album = PhotoAlbumType.new
  end

  def edit
    @photo_album = PhotoAlbumType.find(params[:id])
  end

  def create
    @photo_album = PhotoAlbumType.new params[:photo_album]

    if @photo_album.save
      flash[:success] = flash_translate(:success)
      redirect_to edit_admin_photo_album_path(@photo_album.id)
    else
      render :action => :new
    end
  end

  def update
    @photo_album = PhotoAlbumType.find params[:id]

    if @photo_album.update_attributes(params[:photo_album])
      flash[:success] = flash_translate(:success)
      redirect_to edit_admin_photo_album_path(@photo_album.id)
    else
      render :action => :edit
    end
  end

  def destroy
    @photo_album = PhotoAlbum.find(params[:id])
    @photo_album.destroy
    redirect_to admin_photo_albums_path
  end
end