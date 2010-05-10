require 'enumerator'
require 'gherkin/parser/tag_expression'

module Cucumber
  module Ast
    module FeatureElement #:nodoc:
      attr_accessor :feature

      def add_step(step)
        @raw_steps << step
      end

      def attach_steps(steps)
        steps.each {|step| step.feature_element = self}
      end

      def file_colon_line(line = @line)
        @feature.file_colon_line(line) if @feature
      end

      def first_line_length
        name_line_lengths[0]
      end

      def text_length
        name_line_lengths.max
      end

      def name_line_lengths
        if @name.strip.empty?
          [Ast::Step::INDENT + @keyword.jlength + ': '.jlength]
        else
          @name.split("\n").enum_for(:each_with_index).map do |line, line_number|
            if line_number == 0
              Ast::Step::INDENT + @keyword.jlength + ': '.jlength + line.jlength
            else
              Ast::Step::INDENT + Ast::Step::INDENT + line.jlength
            end
          end
        end
      end

      def matches_scenario_names?(scenario_name_regexps)
        scenario_name_regexps.detect{|name| name =~ @name}
      end

      def backtrace_line(name = "#{@keyword}: #{@name}", line = @line)
        @feature.backtrace_line(name, line) if @feature
      end

      def source_indent(text_length)
        max_line_length - text_length
      end

      def max_line_length
        init
        @steps.max_line_length(self)
      end

      def accept_hook?(hook)
        Gherkin::Parser::TagExpression.new(hook.tag_expressions).eval(source_tag_names)
      end

      def source_tag_names
        (@tags.tag_names + (@feature ? @feature.source_tag_names : [])).uniq
      end

      def tagged_with?(tag)
        source_tag_names.index(tag)
      end

      def language
        @feature.language if @feature
      end
    end
  end
end
