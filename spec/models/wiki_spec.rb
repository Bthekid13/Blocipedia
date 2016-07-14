require 'rails_helper'

RSpec.describe Wiki, type: :model do

  ##Associations
  describe "associations" do
    it { should belong_to(:user) }
  end

  ##Attributes
  describe "attributes" do
    it { should have_db_column(:title).of_type(:string) }
    it { should have_db_column(:body).of_type(:text) }
    it { should have_db_column(:private).of_type(:boolean)}
  end

  describe "validations" do
    it { is_expected.to validate_presence_of(:title)}
    it { is_expected.to validate_presence_of(:body)}
    it { is_expected.to validate_length_of(:title).is_at_least(5)}
    it { is_expected.to validate_length_of(:body).is_at_least(15)}
  end
end
