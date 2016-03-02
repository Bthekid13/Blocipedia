require 'rails_helper'

RSpec.shared_examples_for 'it has attributes' do |model, attributes_hash|
  before :context do
    @hash_of_attributes = model.attribute_names.map {|n| [n.to_sym, model.type_for_attribute(n).type]}.to_h
  end

  attributes_hash.each do |attribute, type|
    describe "#{attribute}" do
      it "it has the attributes #{attribute}" do
        expect(@hash_of_attributes.keys).to include(attribute)
      end
      it "#{attribute} is of the type #{type}" do
        expect(@hash_of_attributes[attribute]).to eq(type)
      end
    end
  end
  it "#{model} has no unlisted attributes" do
    expect(@hash_of_attributes).to eq(attributes_hash)
  end
end