require 'rails_helper'

RSpec.describe "wiki_topics/show", :type => :view do
  before(:each) do
    @wiki_topic = assign(:wiki_topic, WikiTopic.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
