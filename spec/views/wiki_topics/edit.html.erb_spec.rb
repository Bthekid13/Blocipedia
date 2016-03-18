require 'rails_helper'

RSpec.describe "wiki_topics/edit", :type => :view do
  before(:each) do
    @wiki_topic = assign(:wiki_topic, WikiTopic.create!())
  end

  it "renders the edit wiki_topic form" do
    render

    assert_select "form[action=?][method=?]", wiki_topic_path(@wiki_topic), "post" do
    end
  end
end
