require "shoulda-matchers"
require "rails_helper"

RSpec.describe WikiPolicy, type: :policy do
  subject { described_class }
  let(:my_user) { create(:user, name: "my_user", email: "myuser@gmail.com") }
  let(:premium_user) { create(:user, name: "my_user", email: "myuser1@gmail.com", role: :premium) }
  let(:standard_user) { create(:user, name: "other_user", email: "otheruser@gmail.com", role: :standard) }
  let(:my_wiki) { create(:wiki, user: my_user) }
  let(:p_wiki) { create(:wiki, private: true, user: my_user) }


  permissions :update?, :edit? do
    it "denies access if Wiki doensn't belong to the user" do
      expect(subject).not_to permit(standard_user, my_wiki)
    end

    it "grants access if a wiki belongs to a user" do
      expect(subject).to permit(my_user, my_wiki)
    end
  end

  permissions :show? do

    it "denies access if Wiki doensn't belong to the user" do
      expect(subject).not_to permit(standard_user, p_wiki)
    end

    it "grants access if a wiki belongs to a user" do
      expect(subject).to permit(premium_user, p_wiki)
    end
  end

  permissions :destroy? do
    it "denies access if Wiki doensn't belong to the user" do
      expect(subject).not_to permit(standard_user, my_wiki)
    end

    it "grants access if a wiki belongs to a user" do
      expect(subject).to permit(my_user, my_wiki)
    end
  end
end
