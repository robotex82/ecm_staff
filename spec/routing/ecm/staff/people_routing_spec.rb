require 'spec_helper'

module Ecm::Staff
  describe PeopleController do
    it 'routes to #index' do
      get('/en/people').should route_to('ecm/staff/people#index', :i18n_locale => 'en')
    end # it

    it 'routes to #show' do
      get('/en/people/example-person').should route_to(
        'ecm/staff/people#show',
        :i18n_locale => 'en',
        :id          => 'example-person'
      )
    end # it
  end # describe PeopleController
end # module Ecm::Staff
