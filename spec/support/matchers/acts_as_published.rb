# Copyright 2014 Roberto Vasquez Angel
# MIT License
#
# Heavily inspired by: https://gist.github.com/jonahbron/7478033
#
# Installation:
# Add to your spec_helper.rb file:
#     Dir[Rails.root.join("spec/support/**/*.rb")].each { |f| require f }
# Add this file to spec/support/matchers/
#
# Usage:
#     it { should acts_as_published }
#

#module Shoulda
#  module Matchers

    def act_as_published
      ActAsPublishedMatcher.new
    end

    class ActAsPublishedMatcher
      def initialize
      end

      def matches? subject
        subject = subject.class unless Class === subject
        subject.new.respond_to?(:published?) == true
      end

      def failure_message
        "Should act as published"
      end

      def negative_failure_message
        "Should not act as published"
      end

      def description
        "act as published"
      end
    end

#  end
#end
