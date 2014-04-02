require 'active_admin-awesome_nested_set'
require 'acts_as_markup'
require 'acts_as_published'
require 'awesome_nested_set'
require 'friendly_id'

require 'ecm/staff/engine'
require 'ecm/staff/exceptions'
require 'ecm/staff/configuration'
require 'ecm/staff/routing'

module Ecm
  module Staff
    extend Configuration
  end # module Staff
end # module Ecm
