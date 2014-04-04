require "rubygems"
require "deep_test/rake_tasks"

#sample DeepTest task
DeepTest::TestTask.new "task_name" do |t|
  t.pattern = "test/**/*_test.rb"
  t.processes = 2 # optional, defaults to 2
end
