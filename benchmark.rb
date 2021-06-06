require 'benchmark'

n = 5000000
Benchmark.bmbm do |x|
  x.report("string") do
    n.times do
      'hello'
    end
  end
  x.report('translatable string') do
    require 'translate_self'
    n.times do
      'hello'
    end
  end
end