module Ecm::Staff
  class Base < ActiveRecord::Base
    self.abstract_class = true

    def self.table_name_prefix
      'ecm_staff_'
    end
  end
end
