namespace :woo do
  task fetch_products: :environment do
    @base_url = 'https://dev-restocq.terrificminds.com/wp-json/wc/v3'
    @auth_params = {
      consumer_key: Rails.application.credentials.api_key[:consumer_key],
      consumer_secret: Rails.application.credentials.api_key[:consumer_secret]
    }
    product_fetcher = ProductFetcher.new(@auth_params)
    product_fetcher.fetch_products(@base_url)
    puts 'Products fetched successfully!'
  end
end
