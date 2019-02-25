require 'rails_helper'

describe "User" do
  it "user can login" do
    user = User.create(email: 'whatever@example.com', password: 'password')
    headers = { "Content_Type" => "application/json", "Accept" => "application/json" }

    post "/api/v1/sessions",
      :params => {
                  "email": "whatever@example.com",
                  "password": "password",
                  "controller"=>"api/v1/sessions",
                  "action"=>"create"},
                  :headers => headers

    expect(request.params.keys).to include("email")
    expect(request.params.keys).to include("password")

    expect(response).to be_successful

    parsed_response = JSON.parse(response.body)

    expect(parsed_response).to have_key("api_key")
  end
end
