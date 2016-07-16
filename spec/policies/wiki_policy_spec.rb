require "shoulda-matchers"
require "rails_helper"

RSpec.describe WikiPolicy, type: :policy do
  subject { described_class }
  let(:my_user) { create(:user, name: "my_user", email: "myuser@gmail.com") }
  let(:other_user) { create(:user, name: "other_user", email: "otheruser@gmail.com") }
  let(:my_wiki) { create(:wiki, user: my_user) }


  permissions :update?, :edit? do
    it "denies access if Wiki doensn't belong to the user" do
      expect(subject).not_to permit(other_user, my_wiki)
    end

    it "grants access if a wiki belongs to a user" do
      expect(subject).to permit(my_user, my_wiki)
    end
  end

  permissions :destroy? do
    it "denies access if Wiki doensn't belong to the user" do
      expect(subject).not_to permit(other_user, my_wiki)
    end

    it "grants access if a wiki belongs to a user" do
      expect(subject).to permit(my_user, my_wiki)
    end
  end
end
