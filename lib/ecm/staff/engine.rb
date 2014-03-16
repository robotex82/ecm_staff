module Ecm
  module Staff
    class Engine < ::Rails::Engine
      initializer :ecm_staff_engine do
        ::ActiveAdmin.setup do |config|
          config.load_paths << File.join(self.root, 'app/admin')
        end # ::ActiveAdmin.setup
      end if defined?(::ActiveAdmin) # initializer :ecm_staff_engine do
    end # class Engine < ::Rails::Engine
  end # module Staff
end # module Ecm

