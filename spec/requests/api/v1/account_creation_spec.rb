require 'rails_helper'

describe 'account creation ' do
  it 'can create an account' do
    headers = { "Content_Type" => "application/json", "Accept" => "application/json" }

    post "/api/v1/users", :params => {"email"=>"whatever@example.com",
       "password"=>"password",
       "password_confirmation"=>"password",
       "controller"=>"api/v1/users",
       "action"=>"create",
       "user"=>{"email"=>"whatever@example.com"}}, :headers => headers

    expect(request.params.keys).to include("user")
    expect(request.params.keys).to include("email")
    expect(request.params.keys).to include("password")
    expect(request.params.keys).to include("password_confirmation")

    expect(response).to be_successful

    parsed_response = JSON.parse(response.body)

    expect(parsed_response).to have_key("api_key")
  end
end
