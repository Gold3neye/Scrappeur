require 'bundler'
Bundler.require
require 'open-uri'

#Load path variable to require files in lib folder
$:.unshift File.expand_path("./../lib", __FILE__)
require 'app/scrapper'
require 'views/menu'

towns = Townhall.new('https://www.annuaire-des-mairies.com/var.html')
towns.get_townhall_urls
towns.loop_each_town
towns.to_s

menu = Menu.new(towns)