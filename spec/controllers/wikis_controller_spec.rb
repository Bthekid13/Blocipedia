require 'rails_helper'

RSpec.describe WikisController, :type => :controller do

  describe "GET index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_success(:success)
    end
  end

  describe "GET show" do
    it "returns http success" do
      get :show
      expect(response).to have_http_success(:success)
    end
  end

  describe "GET new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_success(:success)
    end
  end

  describe "GET edit" do
    it "returns http success" do
      expect(response).to have_http_success(:success)
    end
  end
end
