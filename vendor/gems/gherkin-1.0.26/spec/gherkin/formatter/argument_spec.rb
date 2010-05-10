# encoding: utf-8
require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')
require 'gherkin/formatter/argument'

module Gherkin
  module Formatter
    class BracketFormat
      class << self
        def new
          defined?(JRUBY_VERSION) ? ::Java::GherkinFormatter::ArgumentFormat.new("[", "]") : super
        end
      end

      def format_argument(s)
        "[#{s}]"
      end
    end
    
    describe Argument do
      it "should replace one arg" do
        argument_class = defined?(JRUBY_VERSION) ? ::Java::GherkinFormatter::Argument : Argument
        argument_class.format("I have 10 cukes", BracketFormat.new, [Argument.new(7, '10')]).should == "I have [10] cukes"
      end
      
      # TODO: Add this spec: http://github.com/alg/cucumber/commit/33188e9db51f59ced74c4861524d7b2e69454630
    end
  end
end
