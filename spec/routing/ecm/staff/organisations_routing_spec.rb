require 'spec_helper'

module Ecm::Staff
  describe OrganisationsController do
    it 'routes to #index' do
      get('/en/organisations').should route_to('ecm/staff/organisations#index', :i18n_locale => 'en')
    end # it

    it 'routes to #show' do
      get('/en/organisations/example-organisation').should route_to(
        'ecm/staff/organisations#show',
        :i18n_locale => 'en',
        :id          => 'example-organisation'
      )
    end # it
  end # describe OrganisationsController
end # module Ecm::Staff
