require 'rake/testtask'

Rake::TestTask.new do |t|
    t.libs << "test" #add to end of array, concatenate
    t.test_files = FileList['tests/test*.rb']
    t.verbose = true
end

