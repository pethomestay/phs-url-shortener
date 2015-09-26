class UrlShortsController < ApplicationController
  before_action :set_url_short, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:forward_to_phs]

  respond_to :html

  def home_index
    if current_user.present?
      redirect_to url_shorts_path
    else
      redirect_to new_user_session_path
    end
  end

  def forward_to_phs
    @url_short = UrlShort.where('lower(code) =?', params[:code].downcase).first
    if @url_short
      @url_short.increment(:hit_count, 1)
      @url_short.save
      redirect_to @url_short.end_point
    else
      redirect_to root_path
    end
  end

  def index
    @url_shorts = UrlShort.all
    respond_with(@url_shorts)
  end

  def show
    respond_with(@url_short)
  end

  def new
    @url_short = UrlShort.new
    respond_with(@url_short)
  end

  def edit
  end

  def create
    @url_short = UrlShort.new(url_short_params)
    @url_short.save
    respond_with(@url_short)
  end

  def update
    @url_short.update(url_short_params)
    respond_with(@url_short)
  end

  def destroy
    @url_short.destroy
    respond_with(@url_short)
  end

  private
    def set_url_short
      @url_short = UrlShort.find(params[:id])
    end

    def url_short_params
      params.require(:url_short).permit(:code, :end_point, :hit_count)
    end
end
