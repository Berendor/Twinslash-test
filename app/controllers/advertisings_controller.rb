# frozen_string_literal: true

class AdvertisingsController < ApplicationController
  load_and_authorize_resource
  def index
    @q = Advertising.ransack(params[:q])
    if params[:search]
      @search_results_advertisings = Advertising.search_by_title_and_text(params[:search])
      respond_to do |format|
        format.js { render partial: 'search-results' }
      end
    else
      @advertisings = @q.result.where(status: 'published').includes(:advertisings_type).paginate(page: params[:page], per_page: 4)
    end
  end

  def show
    @advertising = Advertising.find(params[:id])
  end

  def new
    @advertising = Advertising.new
    @types = AdvertisingsType.all
  end

  def edit
    @advertising = Advertising.find(params[:id])
    @types = AdvertisingsType.all
  end

  def create
    @advertising = Advertising.new(advertising_params)
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

  def update_ad
    @advertising = Advertising.find(params[:id]).update(status: 'new')
  end

  private

  def advertising_params
    params.require(:advertising).permit(:title, :text, :user_id,
       :advertisings_type_id, images: []).merge(user_id: current_user.id)
  end
end
