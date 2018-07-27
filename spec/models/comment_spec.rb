require 'spec_helper'

describe Comment do
  it "should create a new instance given valid attributes" do
    FactoryGirl.define do
      factory :comment do |comment|
        comment.id "1"
        comment.content  'un contenu'
        comment.user_id  "1"
        comment.recette_id  "1"
      end
    end
  end

  describe "Content" do
  # using the accept_values_for gem
    it { should_not accept_values_for(:content, nil) }
    it { should accept_values_for(:content, "sample content") }
    it { should_not accept_values_for(:content, "a") }
    it { should_not accept_values_for(:content, "a"*1025) }
  end

end