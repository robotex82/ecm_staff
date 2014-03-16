require 'active_support/core_ext/module/delegation'
require 'active_support/core_ext/module/attribute_accessors'
require 'active_support/hash_with_indifferent_access'

module Ecm
  module Staff
    module Configuration
      def configure
        yield self
      end # def

      # mattr_accessor :foo
      # @@foo = nil

      mattr_accessor :person_class_name
      @@person_class_name = 'Person'

      def self.person_class_name=(class_name)
        raise PersonClassNotDefinedError unless Object.const_defined?(class_name)
      end # def
    end # module Configuration
  end # module Staff
end # module Ecm
