require 'active_admin-acts_as_list'
require 'active_admin-awesome_nested_set'
require 'activeadmin-translate'
require 'acts_as_list'
require 'acts_as_markup'
require 'acts_as_published'
require 'awesome_nested_set'
require 'ecm_pictures'
require 'friendly_id'
require 'globalize'

require 'ecm/staff/engine'
require 'ecm/staff/exceptions'
require 'ecm/staff/configuration'
require 'ecm/staff/routing'

module Ecm
  module Staff
    extend Configuration
  end # module Staff
end # module Ecm
