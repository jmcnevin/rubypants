desc "Run all the tests"
task :default => [:test, :benchmark]

desc "Run all the tests"
task :test do
  ruby 'test/rubypants_test.rb'
end

RP_BENCH_BASE = 'v0.7.0'.freeze

desc "Benchmark current proposal with tag '#{RP_BENCH_BASE}'"
task :benchmark do
  puts "\n\nBenchmarking current proposal against tag 'v0.7.0'"
  puts "--------------------------------------------------\n\n"
  ruby "benchmark/run.rb #{RP_BENCH_BASE}"
end
