class ProductFetcher
  def initialize(auth_params)
    @auth_params = auth_params
  end

  def fetch_products(base_url)
    products_url = "#{base_url}/products"
    all_products = []
    page = 1
    total_pages = page_count(products_url)

    until page > total_pages
      response = fetch(products_url, page_params(page))
      all_products.concat(JSON.parse(response.body))
      page += 1
    end

    all_products
  end

  private

  def page_count(products_url)
    response = fetch(products_url)
    response.headers[:x_wp_totalpages].to_i
  end

  def page_params(page)
    { per_page: 100, page: page }
  end

  def fetch(url, params = {})
    RestClient.get(url, params: @auth_params.merge(params), accept: :json)
  end
end
