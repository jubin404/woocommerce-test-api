class ApiController < ApplicationController
  protect_from_forgery with: :null_session
  require 'json'

  before_action :set_auth_params, only: [:api]

  def index
  end

  def api
    @base_url = base_url
    product_fetcher = ProductFetcher.new(@auth_params)
    @all_products = product_fetcher.fetch_products(@base_url)
  end

  def webhook
    @data = JSON.parse(request.raw_post)
    # byebug
  end

  private

  def set_auth_params
    @auth_params = {
      consumer_key: Rails.application.credentials.api_key[:consumer_key],
      consumer_secret: Rails.application.credentials.api_key[:consumer_secret]
    }
  end

  def base_url
    'https://dev-restocq.terrificminds.com/wp-json/wc/v3'
  end
end
