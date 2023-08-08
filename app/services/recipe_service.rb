class RecipeService
  def initialize(params)
    @country = params[:country]
  end

  def recipe_by_query

      response = ed_conn.get('?') do |req|
        req.url 'api/recipes/v2/'
        req.params['type'] = "public"
        req.params['app_key'] = ENV["EDAMAM_API_KEY"]
        req.params['app_id'] = ENV["EDAMAM_APP_ID"]
        req.params['q'] = @country
        
      end
      json = JSON.parse(response.body, symbolize_names: true)
  end

  private
  def ed_conn
    Faraday.new("https://api.edamam.com/")
  end

  def rest_conn
    Faraday.new("https://restcountries.com")
  end
end