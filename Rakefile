require 'rubygems'
require 'echoe'
require 'httparty'
require 'fileutils'
require './lib/klout'

Echoe.new 'kloutbg', '1.2.1'  do |p|
  p.author = 'Brad Gilreath'
  p.email = 'bwgilreath@gmail.com'
  p.url = 'http://github.com/bgilreath/klout'
  p.description = "Klout - Twitter Analytics"
  p.runtime_dependencies = ["typhoeus"]
  p.runtime_dependencies = ["httparty"]

end

Dir["#{File.dirname(__FILE__)}/tasks/*.rake"].sort.each { |ext| load ext }