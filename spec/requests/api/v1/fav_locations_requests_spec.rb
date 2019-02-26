require 'rails_helper'

describe "user can favorite locations" do
  it 'favorite' do
    user = User.create(email: 'whatever@example.com', password: 'password', api_key: 'themuffinman')

    headers = { "Content_Type" => "application/json", "Accept" => "application/json" }

    post "/api/v1/favorites", :params => {"location": "Denver, CO",
                                          "api_key": "themuffinman",
                                         "controller"=>"api/v1/favorites",
                                         "action"=>"create",
                                         "user"=>{"email"=>"whatever@example.com"}},
                              :headers => headers

    expect(request.params.keys).to include("location")
    expect(request.params.keys).to include("api_key")

    expect(response).to be_successful
    expect(Favorite.last).to be_an_instance_of(Favorite)
    expect(Favorite.last.location).to eq("denver,co")
  end

  it 'returns failing status code when incorrect api key' do
    user = User.create(email: 'whatever@example.com', password: 'password', api_key: 'turtle')

    headers = { "Content_Type" => "application/json", "Accept" => "application/json" }

    post "/api/v1/favorites", :params => {"location": "Denver, CO",
                                          "api_key": "silverwashere",
                                         "controller"=>"api/v1/favorites",
                                         "action"=>"create",
                                         "user"=>{"email"=>"whatever@example.com"}},
                              :headers => headers

    expect(response.status).to eq(401)
  end

  it 'returns a users favorites cities' do
    user_1 = User.create(email: 'whatever@example.com', password: 'password', api_key: 'iwantajob')
    fav_city_1 =Favorite.create(location: 'denver, CO')
    fav_city_2 =Favorite.create(location: 'el paso, Tx')
    fav_city_3 =Favorite.create(location: 'Los Angeles, CA')
    user_1.user_favorites.create(favorite_id: fav_city_1.id)
    user_1.user_favorites.create(favorite_id: fav_city_2.id)
    user_1.user_favorites.create(favorite_id: fav_city_3.id)

    headers = { "Content_Type" => "application/json", "Accept" => "application/json" }

    get "/api/v1/favorites", :params => {
                                          "api_key": "iwantajob",
                                         "controller"=>"api/v1/favorites",
                                         "action"=>"index",
                                         "user"=>{"email"=>"whatever@example.com"}},
                              :headers => headers

    expect(request.params.keys).to include("api_key")

    expect(response).to be_successful
    expect(response.status).to eq(200)

    expect(Favorite.last).to be_an_instance_of(Favorite)
    expect(Favorite.first).to be_an_instance_of(Favorite)
  end
end
