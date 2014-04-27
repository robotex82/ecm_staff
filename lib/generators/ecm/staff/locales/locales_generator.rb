module Ecm
  module Staff
    module Generators
      class LocalesGenerator < Rails::Generators::Base
        desc "Copies the locale files to your application"

        source_root File.expand_path('../templates', __FILE__)

        def generate_locales
          copy_file "en.yml", "config/locales/ecm.staff.en.yml"
          copy_file "de.yml", "config/locales/ecm.staff.de.yml"
        end
      end
    end
  end
end
