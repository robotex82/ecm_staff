require 'spec_helper'

module Ecm::Staff
  describe PeopleController do
    describe "GET index" do
      before do
        I18n.locale = :en
        @people = FactoryGirl.create_list(:ecm_staff_person, 3)
      end # before

      it "assigns all people to @people" do
        get :index, :i18n_locale => :en
        assigns(:people).should eq(@people)
      end # if
    end # describe "GET index"

#    describe "GET show" do
#      before do
#        I18n.locale = :en
#        @reference_category = FactoryGirl.create(:ecm_references_category, :locale => I18n.locale.to_s)
#      end # before

#      it "assigns the correct reference category to @reference_category" do
#        get :show, :id => @reference_category, :i18n_locale => :en
#        assigns(:reference_category).should eq(@reference_category)
#      end # if
#    end # describe "GET show"
  end # describe PeopleController
end # module Ecm::Staff
