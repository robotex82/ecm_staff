require 'spec_helper'

module Ecm::Staff
  describe BusinessUnitsController do
    describe "GET index" do
      before do
        I18n.locale = :en
        @business_units = FactoryGirl.create_list(:ecm_staff_business_unit, 3)
      end # before

      it "assigns all business units to @business_units" do
        get :index, :i18n_locale => :en
        assigns(:business_units).should eq(@business_units)
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
  end # describe BusinessUnitController
end # module Ecm::Staff
