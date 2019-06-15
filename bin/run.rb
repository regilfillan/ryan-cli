#!/usr/bin/env ruby

# require_relative '../config/environment'
require_relative "../lib/ryan/scraper.rb"


Scraper.scrape_directory_page("https://bpl.bibliocommons.com/locations/list/")