class AdvertisingsController < ApplicationController

  def index
    if params[:search]
      @search_results_advertisings = Advertising.search_by_title_and_text(params[:search])
      respond_to do |format|
        format.js { render partial: 'search-results'}
      end
    else
      @advertisings = Advertising.where(status: 'published').paginate(:page => params[:page], per_page: 4)
    end
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
    # @types = AdvertisingsType.all
    @advertising = Advertising.new(advertising_params)
    @advertising.user = current_user
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
    params.require(:advertising).permit(:title, :text, :advertisings_type, images: [])
  end

end
