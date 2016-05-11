require 'erb'
require 'tilt'
require 'csv'
require './models/senator'

def load_senators(path)
  contents = CSV.open(path, headers: true, header_converters: :symbol)
  contents.map do |row|
    data_hash = {}
    data_hash[:name] = row[:name]
    data_hash[:party] = row[:party]
    data_hash[:state] = row[:state]
    data_hash[:address] = row[:address]
    data_hash[:phone_number] = row[:phone_number]
    data_hash[:web_page] = row[:web_page]
    data_hash[:contact_link] = row[:contact_link]
    Senator.new(data_hash)
  end
end

def generate_senator_html(senators)
  senators.map do |senator|
    @senator_layout.render(senator)
  end.join
end

@layout = Tilt.new('templates/layout.erb')
@senator_layout = Tilt.new('templates/senator.erb')

senators = load_senators('data/ussenator.csv')

html_output = @layout.render { generate_senator_html(senators) }

out_file = File.new("index.html", "w")
out_file.puts(html_output)
out_file.close
