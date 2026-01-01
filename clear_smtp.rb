#!/usr/bin/env ruby

# Clear SMTP settings from DocuSeal database
puts "Clearing SMTP settings from database..."

begin
  # Try to clear encrypted configs related to SMTP
  EncryptedConfig.where("key LIKE ?", "%smtp%").destroy_all
  puts "✅ Cleared SMTP settings from database"
  puts "DocuSeal will now use environment variables from .env file"
rescue => e
  puts "❌ Error: #{e.message}"
end