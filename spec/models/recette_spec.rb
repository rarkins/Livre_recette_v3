require 'spec_helper'

describe Recette do
  it "should create a new instance given valid attributes" do
    FactoryGirl.define do
      factory :recette do |recette|
        recette.id "1"
        recette.titre  'un titre'
        recette.auteur  "1"
        recette.accompagnement  "test"
        recette.cuisson  "test"
        recette.ingredient  "test"
        recette.instruction  "test"
        recette.marinage  "test"
        recette.note  "test"
        recette.portion  "test"
        recette.preparation  "test"
        recette.source  "test"
        recette.vin  "test"
      end
    end
  end

  describe "titre" do
  # using the accept_values_for gem
    it { should_not accept_values_for(:titre, nil) }
    it { should accept_values_for(:titre, "sample title") }
    it { should_not accept_values_for(:titre, "a") }
    it { should_not accept_values_for(:titre, "a"*256) }
  end

  describe "auteur" do
  # using the accept_values_for gem
    it { should_not accept_values_for(:user_id, nil) }
    it { should accept_values_for(:user_id, 1) }
    it { should_not accept_values_for(:user_id, "a") }
  end

  describe "accompagnement" do
  # using the accept_values_for gem
    it { should accept_values_for(:accompagnement, nil) }
    it { should accept_values_for(:accompagnement, "sample accompagnement") }
    it { should_not accept_values_for(:accompagnement, "a") }
  end

  describe "cuisson" do
  # using the accept_values_for gem
    it { should accept_values_for(:cuisson, nil) }
    it { should accept_values_for(:cuisson, "sample cuisson") }
    it { should_not accept_values_for(:cuisson, "a") }
    it { should_not accept_values_for(:cuisson, "a"*256) }
  end

  describe "ingredients" do
  # using the accept_values_for gem
    it { should_not accept_values_for(:ingredient, nil) }
    it { should accept_values_for(:ingredient, "sample ingredients") }
  end

  describe "instruction" do
  # using the accept_values_for gem
    it { should_not accept_values_for(:instruction, nil) }
    it { should accept_values_for(:instruction, "sample instruction") }
  end

  describe "marinage" do
  # using the accept_values_for gem
    it { should accept_values_for(:marinage, nil) }
    it { should accept_values_for(:marinage, "sample marinage") }
    it { should_not accept_values_for(:marinage, "a") }
    it { should_not accept_values_for(:marinage, "a"*256) }
  end

  describe "portion" do
    it { should accept_values_for(:portion, nil) }
    it { should accept_values_for(:portion, "sample portion") }
    it { should_not accept_values_for(:portion, "a") }
    it { should_not accept_values_for(:portion, "a"*256) }
  end

  describe "preparation" do
    it { should_not accept_values_for(:preparation, nil) }
    it { should accept_values_for(:preparation, "sample preparation") }
    it { should_not accept_values_for(:preparation, "a") }
    it { should_not accept_values_for(:preparation, "a"*256) }
  end

  describe "source" do
    it { should accept_values_for(:source, nil) }
    it { should accept_values_for(:source, "sample source") }
    it { should_not accept_values_for(:source, "a") }
    it { should_not accept_values_for(:source, "a"*257) }
  end

  describe "vin" do
    it { should accept_values_for(:vin, nil) }
    it { should accept_values_for(:vin, "sample vin") }
    it { should_not accept_values_for(:vin, "a") }
    it { should_not accept_values_for(:vin, "a"*257) }
  end

end