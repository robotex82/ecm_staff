module Ecm::Staff
  class Routing
    def self.routes(router, options = {})
      options.reverse_merge!(
        { :organisations_actions  => [:index, :show],
          :business_units_actions => [:index, :show],
          :people_actions         => [:index, :show],
        }
      )

      router.resources :ecm_staff_organisations,  :only       => options[:organisations_actions],
                                                  :controller => 'ecm/staff/organisations'
      router.resources :ecm_staff_business_units, :only       => options[:business_units_actions],
                                                  :controller => 'ecm/staff/business_units'
      router.resources :ecm_staff_people,         :only       => options[:people_actions],
                                                  :controller => 'ecm/staff/people'
    end # def
  end # Routing
end # module Ecm::Staff
