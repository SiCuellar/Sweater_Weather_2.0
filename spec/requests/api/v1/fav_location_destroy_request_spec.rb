require "rails_helper"

describe 'request' do
  it 'removes city from users favorites' do
    user_1 = User.create(email: 'whatever@example.com', password: 'password', api_key: 'helloworld')
    fav_city_1 =Favorite.create(location: 'Denver, CO')
    fav_city_2 =Favorite.create(location: 'Los Angeles, CA')
    fav_city_3 =Favorite.create(location: 'Austin, TX')
    user_1.user_favorites.create(favorite_id: fav_city_1.id)
    user_1.user_favorites.create(favorite_id: fav_city_2.id)
    user_1.user_favorites.create(favorite_id: fav_city_3.id)

    headers = { "Content_Type" => "application/json", "Accept" => "application/json" }

    delete "/api/v1/favorites", :params => {
                                            "location": "Denver, CO",
                                              "api_key": "helloworld",
                                             "controller"=>"api/v1/favorites",
                                             "action"=>"destroy"},
                                :headers => headers

    expect(request.params.keys).to include("api_key")
    expect(request.params.keys).to include("location")

    expect(response).to be_successful
    expect(response.status).to eq(204)
    expect(user_1.favorites.count).to eq(2)
  end

  it 'returns error message if wrong api key' do
    user_1 = User.create(email: 'whatever@example.com', password: 'password', api_key: 'alksjhf')
    fav_city_1 =Favorite.create(location: 'Denver, CO')
    fav_city_2 =Favorite.create(location: 'Los Angeles, CA')
    user_1.user_favorites.create(favorite_id: fav_city_1.id)
    user_1.user_favorites.create(favorite_id: fav_city_2.id)

    headers = { "Content_Type" => "application/json", "Accept" => "application/json" }

    delete "/api/v1/favorites", :params => {
                                    "location": "Denver, CO",
                                      "api_key": "pigscanfly",
                                     "controller"=>"api/v1/favorites",
                                     "action"=>"destroy"},
                                  :headers => headers

    expect(request.params.keys).to include("api_key")
    expect(request.params.keys).to include("location")

    expect(response.status).to eq(401)
    expect(user_1.favorites.count).to eq(2)
  end
end
