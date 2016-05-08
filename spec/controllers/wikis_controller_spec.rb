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
      expect(response).to render_template(:index)
    end
  end

  describe "GET show" do
    it "returns http success" do
      get :show, {id: @wiki.id}
      expect(response).to have_http_status(:success)
      expect(response).to render_template(:show)
      expect(assigns(:wiki)).to be(@wiki)
    end
  end

  describe "GET new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
      expect(response).to render_template(:new)
    end
  end

  describe "GET edit" do
    let(:request) { get :edit, {id: @wiki.id} }
    
    it "returns http success" do
      request
      expect(response).to have_http_status(:success)
    end
    
    it 'renders the edit template' do
      request
      expect(response).to render_template(:edit)
    end
  end
end
