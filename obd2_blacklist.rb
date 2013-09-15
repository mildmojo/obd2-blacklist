require 'bundler'

require 'obd'

err = true

while err do
  puts 'Connecting to OBD2 adapter...'
  obd, err = OBD.connect "/dev/rfcomm0", 9600
  sleep 1
end
