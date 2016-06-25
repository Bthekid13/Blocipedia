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
end
