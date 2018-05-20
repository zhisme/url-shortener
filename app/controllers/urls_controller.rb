class UrlsController < ApplicationController
  before_action :find_url, only: :show

  def create
    @url = Url.new(permit_params)

    if @url.save
      render json: {url: @url.short_url}, status: :created
    else
      render json: {errors: @url.errors}, status: :unprocessable_entity
    end
  end

  def show
    redirect_to @url.long_url
  end

  private

  def find_url
    @url = Url.find_by!(
      short_url: "#{Rails.application.secrets[:base_url]}/#{find_params[:short_url]}")
  end

  def permit_params
    params.permit(:long_url)
  end

  def find_params
    params.permit(:short_url)
  end
end
