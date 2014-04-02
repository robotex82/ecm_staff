module Ecm::Staff
  class Routing
    def self.routes(router, options = {})
      options.reverse_merge!({})

      router.resources :ecm_staff_organisations, :controller => 'ecm/staff/organisations'
      router.resources :ecm_staff_business_units, :controller => 'ecm/staff/business_units'
    end # def
  end # Routing
end # module Ecm::Staff
