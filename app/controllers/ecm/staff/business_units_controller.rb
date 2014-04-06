module Ecm::Staff
  class BusinessUnitsController < ApplicationController
    def index
      @business_units = BusinessUnit.all
    end # def

#    def show
#      @reference_category = Category.with_public_visibility.find(params[:id])
#    end # def
  end
end
