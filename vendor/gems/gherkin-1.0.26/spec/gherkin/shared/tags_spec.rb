# encoding: utf-8
require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

module Gherkin
  module Lexer
    shared_examples_for "a Gherkin lexer lexing tags" do
      it "should lex a single tag" do
        @listener.should_receive(:tag).with("@dog", 1)
        @lexer.scan("@dog\n")
      end
  
      it "should lex multiple tags" do
        @listener.should_receive(:tag).twice
        @lexer.scan("@dog @cat\n")
      end
  
      it "should lex UTF-8 tags" do
        @listener.should_receive(:tag).with("@シナリオテンプレート", 1)
        @lexer.scan("@シナリオテンプレート\n")
      end
        
      it "should lex mixed tags" do
        @listener.should_receive(:tag).with("@wip", 1).ordered
        @listener.should_receive(:tag).with("@Значения", 1).ordered
        @lexer.scan("@wip @Значения\n")
      end
  
      it "should lex wacky identifiers" do
        @listener.should_receive(:tag).exactly(4).times
        @lexer.scan("@BJ-x98.77 @BJ-z12.33 @O_o" "@#not_a_comment\n")
      end

      # TODO: Ask on ML for opinions about this one
      it "should lex tags without spaces between them?" do
        @listener.should_receive(:tag).twice
        @lexer.scan("@one@two\n")
      end
    
      it "should not lex tags beginning with two @@ signs" do
        @listener.should_not_receive(:tag)
        lambda { @lexer.scan("@@test\n") }.should raise_error(/Lexing error on line 1/)
      end
    
      it "should not lex a lone @ sign" do
        @listener.should_not_receive(:tag)
        lambda { @lexer.scan("@\n") }.should raise_error(/Lexing error on line 1/)
      end
    end
  end
end
