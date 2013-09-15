require 'bundler/setup'

require 'obd'

err = true

while err do
  puts 'Connecting to OBD2 adapter...'
  obd, err = OBD.connect "/dev/rfcomm0", 9600
  sleep 1
end


while true
  response = obd['03']

  if response.length <= 2
    STDERR.puts 'short response'
    next
  end

  codes = []
  response = response[2..-1]
  until response.empty?
    codes << response[0..3]
    response = response[4..-1]
  end

  if codes.all? { |code| blacklist.include?(code) }
    clear_codes
  end

  sleep 5
end

def clear_codes
  puts 'OH NOES NOT ENOUGH TIME'
end
