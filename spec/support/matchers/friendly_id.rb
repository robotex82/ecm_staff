# Copyright 2013 Jonah Dahlquist
# Creative Commons Attribution 3.0
#
# Installation:
# Add to your spec_helper.rb file:
#     Dir[Rails.root.join("spec/support/**/*.rb")].each { |f| require f }
# Add this file to spec/support/matchers/
#
# Usage:
#     it { should have_friendly_id :title }
#

#module Shoulda
#  module Matchers

    def have_friendly_id column
      HaveFriendlyIdMatcher.new column
    end

    class HaveFriendlyIdMatcher
      def initialize column
        @column = column
      end

      def matches? subject
        subject = subject.class unless Class === subject

        subject.friendly_id_config.base == @column
      end

      def failure_message
        "Should have friendly_id %s" % @column
      end

      def negative_failure_message
        "Should not have friendly_id %s" % @column
      end

      def description
        "have friendly_id"
      end
    end

#  end
#end
