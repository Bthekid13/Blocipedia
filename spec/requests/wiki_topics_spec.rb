require 'rails_helper'

RSpec.describe "WikiTopics", :type => :request do
  describe "GET /wiki_topics" do
    it "works! (now write some real specs)" do
      get wiki_topics_path
      expect(response.status).to be(200)
    end
  end
end
