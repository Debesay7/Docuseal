#!/usr/bin/env ruby

require 'net/smtp'

# Test SMTP configuration
smtp_server = 'smtp.gmail.com'
smtp_port = 587
username = 'stmichealerotc@gmail.com'
password = 'ivst bjjn hjoh pyqi'
from_email = 'stmichealerotc@gmail.com'
to_email = 'test@example.com'

puts "Testing SMTP configuration..."
puts "Server: #{smtp_server}:#{smtp_port}"
puts "Username: #{username}"
puts "Password: #{password[0..3]}****"

begin
  smtp = Net::SMTP.new(smtp_server, smtp_port)
  smtp.enable_starttls
  smtp.start('gmail.com', username, password, :plain) do |smtp_session|
    puts "✅ SMTP connection successful!"
    puts "Authentication working with Gmail"
  end
rescue => e
  puts "❌ SMTP connection failed: #{e.message}"
  puts "Error class: #{e.class}"
end