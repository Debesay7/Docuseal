#!/usr/bin/env ruby

require 'net/smtp'

# SMTP configuration from .env
smtp_server = 'smtp.gmail.com'
smtp_port = 587
username = 'stmichealerotc@gmail.com'
password = 'qyyxhmnizdwexyvb'
from_email = 'stmichealerotc@gmail.com'
to_email = 'stmichealerotc@gmail.com'  # Test sending to yourself

puts "Testing SMTP connection to Gmail..."
puts "Server: #{smtp_server}:#{smtp_port}"
puts "Username: #{username}"
puts "From: #{from_email}"
puts "To: #{to_email}"
puts "-" * 50

begin
  # Create SMTP connection
  smtp = Net::SMTP.new(smtp_server, smtp_port)
  smtp.enable_starttls
  
  puts "Connecting to SMTP server..."
  smtp.start(smtp_server, username, password, :plain) do |smtp_session|
    puts "✅ SMTP connection successful!"
    puts "Authentication: OK"
    
    # Test sending a simple email
    message = <<~EOF
      From: #{from_email}
      To: #{to_email}
      Subject: DocuSeal SMTP Test
      Date: #{Time.now.strftime('%a, %d %b %Y %H:%M:%S %z')}
      
      This is a test email from DocuSeal SMTP configuration.
      If you receive this, your email settings are working correctly.
    EOF
    
    puts "Sending test email..."
    smtp_session.send_message(message, from_email, to_email)
    puts "✅ Test email sent successfully!"
  end
  
rescue Net::SMTPAuthenticationError => e
  puts "❌ SMTP Authentication Error: #{e.message}"
  puts "Check your Gmail app password and 2FA settings"
rescue Net::SMTPServerBusy => e
  puts "❌ SMTP Server Busy: #{e.message}"
rescue Net::SMTPSyntaxError => e
  puts "❌ SMTP Syntax Error: #{e.message}"
rescue Net::SMTPFatalError => e
  puts "❌ SMTP Fatal Error: #{e.message}"
rescue => e
  puts "❌ General Error: #{e.class} - #{e.message}"
  puts e.backtrace.first(5)
end

puts "-" * 50
puts "SMTP test completed."