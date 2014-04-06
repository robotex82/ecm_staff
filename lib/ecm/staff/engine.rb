module Ecm
  module Staff
    class Engine < ::Rails::Engine
      initializer :ecm_staff_engine do
        ActiveAdmin.setup do |config|
          config.load_paths << File.join(self.root, 'app/admin')
          # config.load_paths.unshift File.join(self.root, 'app/admin')

          config.register_stylesheet 'ecm_staff_active_admin.css'
        end if defined?(::ActiveAdmin) # ::ActiveAdmin.setup
      end # initializer :ecm_staff_engine do
    end # class Engine < ::Rails::Engine
  end # module Staff
end # module Ecm
