task default: %w[test]

task :run do
  sh 'bundle exec ruby main.rb'
end

task :test do
  sh 'bundle exec rspec'
end

task :help do
  puts "Available tasks:"
  puts "  rake run       # Run the main application"
  puts "  rake test      # Run the tests"
  puts "  rake help      # Show this help message"
end
