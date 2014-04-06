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
#     it { should have_markup :description }
#

#module Shoulda
#  module Matchers

    def have_markup column
      HaveMarkupMatcher.new column
    end

    class HaveMarkupMatcher
      def initialize column
        @column = column
      end

      def matches? subject
        subject = subject.class unless Class === subject
        subject.new.send("#{@column}").respond_to?(:to_html) == true
#        subject.new.send("#{column}=", "h1. Let's test for markdown")
#        subject.send("#{column}").should eq("<h1>Let's test for markdown</h1>")
      end

      def failure_message
        "Should have markup %s" % @column
      end

      def negative_failure_message
        "Should not have markup %s" % @column
      end

      def description
        "have markup"
      end
    end

#  end
#end
