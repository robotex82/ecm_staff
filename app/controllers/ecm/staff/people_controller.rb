module Ecm::Staff
  class PeopleController < ApplicationController
    def index
      @people = Person.includes( :person_positions => :position ).all
    end

    def show
      @person = Person.includes( :person_positions => :position ).find(params[:id])
    end
  end
end
