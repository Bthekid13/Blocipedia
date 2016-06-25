# == Schema Information
#
# Table name: wikis
#
#  id         :integer          not null, primary key
#  title      :string
#  body       :text
#  private    :boolean
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  topic_id   :integer
#  users_id   :integer
#

require 'rails_helper'

RSpec.describe WikisController, :type => :controller do
  before :example do
    @user = create :user
    sign_in @user
    @wiki = create :wiki
  end

  describe "GET index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
    it "renders index template template" do
      get :index
      expect(response).to render_template(:index)
    end
  end

  describe "GET show" do
    let(:request) {get :show, {id: @wiki.id}}
    it "returns http success" do
      request
      expect(response).to have_http_status(:success)
    end

    it "renders show template" do
      request
      expect(response).to render_template(:show)
    end
  end

  describe "GET new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
    it "renders new template" do
      get :new
      expect(response).to render_template(:new)
    end
  end

  describe "GET edit" do
    let(:request) { get :edit, {id: @wiki.id}}

    it "returns http success" do
      request
      expect(response).to have_http_status(:success)
    end
    it "renders edit template" do
      request
      expect(response).to render_template(:edit)
    end
  end
  describe "DELETE destroy" do
    it "redirects to referrer " do
      request.env["HTTP_REFERER"] = root_path
      delete :destroy, {id: @wiki.id}
      expect(response).to redirect_to request.referrer
    end
  end
end
