#!/usr/bin/env ruby
require 'Nokogiri'
require 'open-uri'
require 'csv'

#point it at your webpage
url = "https://en.wikipedia.org/wiki/List_of_parishes_in_Louisiana"

#get the webpage as HTML
html = Nokogiri::HTML(open(url))

#make a csv out of the html table
csv = CSV.open("la_parishes.csv", "w",{:col_sep => ",", :quote_char => '\'', :force_quotes => true})

html.xpath('//table[2]//tr').each do |row|
	tarray = []
	row.xpath('td').each do |cell|
		tarray << cell.text
	end
	csv << tarray
end

csv.close