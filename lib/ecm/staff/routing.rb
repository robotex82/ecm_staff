module Ecm::Staff
  class Routing
    def self.routes(router, options = {})
      options.reverse_merge!({})

      router.resources :ecm_staff_organisations,  :only       => [ :index, :show ],
                                                  :controller => 'ecm/staff/organisations'
      router.resources :ecm_staff_business_units, :only       => [ :index, :show ],
                                                  :controller => 'ecm/staff/business_units'
      router.resources :ecm_staff_people,         :only       => [ :index, :show ],
                                                  :controller => 'ecm/staff/people'
    end # def
  end # Routing
end # module Ecm::Staff
