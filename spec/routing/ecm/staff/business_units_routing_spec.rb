require 'spec_helper'

module Ecm::Staff
  describe BusinessUnitsController do
    it 'routes to #index' do
      get('/en/business-units').should route_to('ecm/staff/business_units#index', :i18n_locale => 'en')
    end # it

    it 'routes to #show' do
      get('/en/business-units/example-business-unit').should route_to(
        'ecm/staff/business_units#show',
        :i18n_locale => 'en',
        :id          => 'example-business-unit'
      )
    end # it
  end # describe BusinessUnitController
end # module Ecm::Staff
