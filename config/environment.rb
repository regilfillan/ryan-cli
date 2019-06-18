require "bundler/setup"
Bundler.require(:default, :development)

require_relative "../lib/cli.rb"
require_relative "../lib/podcast.rb"
require_relative "../lib/podbay_scraper.rb"