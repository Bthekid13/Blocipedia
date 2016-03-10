require "rails_helper"

RSpec.describe WikiTopicsController, :type => :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/wiki_topics").to route_to("wiki_topics#index")
    end

    it "routes to #new" do
      expect(:get => "/wiki_topics/new").to route_to("wiki_topics#new")
    end

    it "routes to #show" do
      expect(:get => "/wiki_topics/1").to route_to("wiki_topics#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/wiki_topics/1/edit").to route_to("wiki_topics#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/wiki_topics").to route_to("wiki_topics#create")
    end

    it "routes to #update" do
      expect(:put => "/wiki_topics/1").to route_to("wiki_topics#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/wiki_topics/1").to route_to("wiki_topics#destroy", :id => "1")
    end

  end
end
