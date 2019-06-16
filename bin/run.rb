#!/usr/bin/env ruby

# require_relative '../config/environment'
require_relative "../lib/scraper.rb"


Scraper.scrape_directory_page("https://www.podcastinsights.com/top-us-podcasts/")