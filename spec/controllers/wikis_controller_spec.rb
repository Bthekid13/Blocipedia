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
  let (:wiki) { create(:wiki) }
  describe "GET index" do
    it "returns http success" do
      get :index, {id: wiki.id}
      expect(response).to have_http_success(:success)
    end
  end

  describe "GET show" do
    it "returns http success" do
      get :show, {id: wiki.id}
      expect(response).to have_http_success(:success)
    end
  end

  describe "GET new" do
    it "returns http success" do
      get :new, {id: wiki.id}
      expect(response).to have_http_success(:success)
    end
  end

  describe "GET edit" do
    it "returns http success" do
      get :edit, {id: wiki.id}
      expect(response).to have_http_success(:success)
    end
  end
end
