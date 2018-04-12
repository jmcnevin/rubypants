# frozen_string_literal: true

require 'benchmark/ips'
require_relative File.expand_path('rubypants_pro.rb', __dir__)
require_relative File.expand_path('../lib/rubypants.rb', __dir__)

SAMPLE = <<-HTML
<p>
  This is just a sample text. But first, lets insert a couple of paragraphs of
  gibberish.
</p>
<p>
  Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris varius dui
  nec nisi facilisis malesuada. Aenean tristique et dolor sed volutpat. Nulla
  sapien dui, faucibus quis purus at, pretium fringilla ante. Vivamus sed
  ornare nisl. Aenean eu augue sit amet diam vehicula auctor et sed nulla. Orci
  varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus
  mus. Curabitur pharetra tellus nec neque malesuada aliquam. Etiam pellentesque
  sapien non ullamcorper sagittis. Sed dui purus, ornare id vulputate blandit,
  porttitor eget odio. Vestibulum ultricies ipsum quis orci malesuada lacinia.
  Phasellus dapibus tempor tortor, nec suscipit tellus malesuada quis. Nunc
  venenatis turpis justo, nec mollis orci vehicula nec. Sed a mattis dui. In
  ut vehicula nulla, in fermentum diam. Vestibulum vestibulum dui a orci
  commodo, sed pretium odio consequat. Pellentesque eu ex lectus.
</p>
<p>
  Sed ultricies mauris eu leo fringilla, id consectetur lectus mollis. Nam sed
  nulla non arcu pulvinar rutrum vitae eu elit. Praesent finibus enim at augue
  viverra malesuada. Ut eget ipsum et quam finibus commodo non vel eros. Aenean
  ac orci est. Nam metus justo, condimentum vitae leo et, pretium scelerisque
  lectus. Praesent tincidunt convallis purus, sit amet bibendum massa facilisis
  ac.
</p>
<p>
  Praesent ac mollis arcu, et blandit leo. Morbi faucibus, turpis in luctus
  eleifend, felis ex bibendum enim, non semper dui nisl at enim. Phasellus
  interdum ac elit in tempus. Pellentesque accumsan varius tempor. Donec
  vulputate ullamcorper ante, vel tempor augue mollis non. Nam a orci vel
  felis fermentum feugiat. Donec luctus elementum ante non luctus. Aliquam
  placerat libero quam, eget congue velit ornare ac.
</p>
<p>
  Pellentesque habitant morbi tristique senectus et netus et malesuada fames
  ac turpis egestas. Proin mollis sem non leo vehicula, sagittis rutrum tortor
  pulvinar. Nullam laoreet nunc id laoreet dictum. Donec ac tristique nunc.
  Maecenas dignissim finibus blandit. Proin malesuada eget elit sed sodales.
  Cras semper sem nec arcu auctor, in mollis nibh molestie.
</p>
<p>
  Proin consectetur odio est. Ut nec eros dui. Mauris sit amet molestie felis,
  non mattis felis. Suspendisse dignissim semper lorem id cursus. Sed et libero
  eros. Nam ipsum est, mattis id nibh at, euismod sodales nisi. Aliquam erat
  volutpat. Mauris et erat felis. Morbi id ipsum massa. Nullam tincidunt, sapien
  quis tincidunt consequat, tortor lacus lobortis ex, a tempus sapien sapien ut
  metus. Morbi sagittis velit neque, nec aliquam nunc semper faucibus. Donec
  congue id nisi euismod tempor.
</p>
<p>
  "Hello World!" said Jane's monitor, when Jake hit the `ENTER` key.
  That was probably their 'Eureka' moment --- one of the many such moments
  yet to come. <br/>
</p>
<p>
  The code under the hood was as simple...
  <pre>
    class Kurtanna
      def announce
        puts "Hello World!"
      end
    end

    Kurtanna.new.announce
  </pre>
HTML

def rubypants_stable_output
  RubyPantsPRO.new(SAMPLE).to_html
end

def rubypants_unstable_output
  RubyPants.new(SAMPLE).to_html
end

if rubypants_stable_output == rubypants_unstable_output
  Benchmark.ips do |x|
    x.report(ARGV[0].to_s) { rubypants_stable_output }
    x.report('current') { rubypants_unstable_output }
    x.compare!
  end
else
  puts "WARNING: "
  puts "---------"
  puts "The output from current proposal doesn't tally with the output"
  puts "from the last released version."
  puts "Perhaps a breaking-change somewhere..?"
end
