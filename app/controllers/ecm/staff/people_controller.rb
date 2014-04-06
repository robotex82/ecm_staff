module Ecm::Staff
  class PeopleController < ApplicationController
    def index
      @people = Person.includes( :person_positions => :position ).all
    end
  end
end
