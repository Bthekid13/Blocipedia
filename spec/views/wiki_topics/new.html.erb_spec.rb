require 'rails_helper'

RSpec.describe "wiki_topics/new", :type => :view do
  before(:each) do
    assign(:wiki_topic, WikiTopic.new())
  end

  it "renders new wiki_topic form" do
    render

    assert_select "form[action=?][method=?]", wiki_topics_path, "post" do
    end
  end
end
