module Ecm
  module Staff
    class Engine < ::Rails::Engine
      initializer :ecm_staff_engine do
        ActiveAdmin.setup do |config|
          config.load_paths << File.join(self.root, 'lib/ecm/staff/active_admin')

          config.register_stylesheet 'ecm_staff_active_admin.css'
        end
      end # initializer :ecm_staff_engine do
    end # class Engine < ::Rails::Engine
  end # module Staff
end # module Ecm
