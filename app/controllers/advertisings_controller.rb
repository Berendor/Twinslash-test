class AdvertisingsController < ApplicationController

  def index
    @advertisings = Advertising.paginate(:page => params[:page], per_page: 2)
  end

  def show
    @advertising = Advertising.find(params[:id])
  end

  def new
    @advertising = Advertising.new
  end

  def edit
    @advertising = Advertising.find(params[:id])
  end

  def create
    @advertising = Advertising.create!(advertising_params)
    if @advertising.save
      redirect_to @advertising
    else
      render 'new'
    end
  end

  def update
    @advertising = Advertising.find(params[:id])

    if @advertising.update(advertising_params)
      redirect_to @advertising
    else
      render 'edit'
    end
  end

  def destroy
    @advertising = Advertising.find(params[:id])
    @advertising.destroy

    redirect_to advertisings_path
  end

  def delete_image_attachment
    @image = ActiveStorage::Attachment.find(params[:id])
    @image.purge

    redirect_back(fallback_location: advertising_path)
  end

private

  def advertising_params
    params.require(:advertising).permit(:title, :text, images: [])
  end

end
