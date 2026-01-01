#!/usr/bin/env ruby

puts "Checking SMTP settings in database..."
puts "=" * 50

begin
  configs = EncryptedConfig.all
  smtp_configs = configs.select { |c| c.key.include?('smtp') }
  
  if smtp_configs.empty?
    puts "❌ No SMTP settings found in database"
  else
    puts "✅ Found SMTP settings:"
    smtp_configs.each do |config|
      puts "  #{config.key}: #{config.value}"
    end
  end
  
  puts "\nEnvironment variables:"
  puts "  SMTP_ADDRESS: #{ENV['SMTP_ADDRESS']}"
  puts "  SMTP_USER_NAME: #{ENV['SMTP_USER_NAME']}"
  puts "  SMTP_PASSWORD: #{ENV['SMTP_PASSWORD']}"
  puts "  SMTP_FROM: #{ENV['SMTP_FROM']}"
  
rescue => e
  puts "❌ Error: #{e.message}"
end