require 'rails_helper'

RSpec.describe "wiki_topics/index", :type => :view do
  before(:each) do
    assign(:wiki_topics, [
      WikiTopic.create!(),
      WikiTopic.create!()
    ])
  end

  it "renders a list of wiki_topics" do
    render
  end
end
