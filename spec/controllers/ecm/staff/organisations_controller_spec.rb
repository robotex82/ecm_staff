require 'spec_helper'

module Ecm::Staff
  describe OrganisationsController do
    describe "GET index" do
      before do
        I18n.locale = :en
        @organisations = FactoryGirl.create_list(:ecm_staff_organisation, 3)
      end # before

      it "assigns all organisations to @organisations" do
        get :index, :i18n_locale => :en
        assigns(:organisations).should eq(@organisations)
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
  end # describe OrganisationsController
end # module Ecm::Staff
