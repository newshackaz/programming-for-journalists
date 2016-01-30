#!/usr/bin/ruby

require 'open-uri'
require 'csv'

csv_string = ""
csv_array = Array.new

open('http://www.pima.gov/restaurantratings/restname_alpha.asp?letter=A&Size=100&Submit=Submit&page=5') do |file|
  file.each_line { |line|

    # quick and dirty cleanup

    if line.match(/<tr>/)
      line = file.gets
      line.gsub!(/<span class='tabledata'>/, "|")
      line.gsub!(/<\/?[^>]*>/, "")
      line.gsub!(/\s+/, " ")
      line.gsub!(/ &nbsp;/, "")
      line.strip!
      line.gsub!(/^\|/, "")
      line.gsub!(/\|\|/, "|")
      line += "|Tucson|AZ"

      # don't save any lines that have less than 5 fields
      temp = line.split(/\|/)
      if temp.length == 7
        csv_string += line + "\n"
      end

    end

  }

  # output a csv file with our data
  csv_array = CSV.parse(csv_string, col_sep: '|')
  CSV.open('scraping.csv', 'w') do |csv_object|
    csv_array.each do |row_array|
      csv_object << row_array
    end
  end

end
