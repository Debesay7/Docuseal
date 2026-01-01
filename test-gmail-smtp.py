#!/usr/bin/env python3

import smtplib
import ssl
from email.mime.text import MIMEText
from email.mime.multipart import MIMEMultipart
import os

# SMTP configuration from .env
smtp_server = "smtp.gmail.com"
smtp_port = 587
username = "stmichealerotc@gmail.com"
password = "ivstbjjnhjohpyqi"  # Your app password
from_email = "stmichealerotc@gmail.com"
to_email = "stmichealerotc@gmail.com"  # Test sending to yourself

print("Testing Gmail SMTP connection...")
print(f"Server: {smtp_server}:{smtp_port}")
print(f"Username: {username}")
print(f"From: {from_email}")
print(f"To: {to_email}")
print("-" * 50)

try:
    # Create message
    message = MIMEMultipart()
    message["From"] = from_email
    message["To"] = to_email
    message["Subject"] = "DocuSeal SMTP Test"
    
    body = """
    This is a test email from DocuSeal SMTP configuration.
    If you receive this, your email settings are working correctly.
    
    Test performed at: {timestamp}
    """.format(timestamp=__import__('datetime').datetime.now())
    
    message.attach(MIMEText(body, "plain"))
    
    # Create SMTP session
    print("Connecting to Gmail SMTP server...")
    server = smtplib.SMTP(smtp_server, smtp_port)
    server.starttls()  # Enable security
    
    print("Authenticating...")
    server.login(username, password)
    print("✅ Authentication successful!")
    
    # Send email
    print("Sending test email...")
    text = message.as_string()
    server.sendmail(from_email, to_email, text)
    server.quit()
    
    print("✅ Test email sent successfully!")
    print("Check your inbox for the test email.")
    
except smtplib.SMTPAuthenticationError as e:
    print(f"❌ SMTP Authentication Error: {e}")
    print("Possible issues:")
    print("1. Incorrect Gmail app password")
    print("2. 2-Factor Authentication not enabled")
    print("3. App password not generated correctly")
    print("\nTo fix:")
    print("1. Go to Google Account settings")
    print("2. Enable 2-Factor Authentication")
    print("3. Generate a new App Password for 'Mail'")
    print("4. Use that app password in your .env file")
    
except smtplib.SMTPServerDisconnected as e:
    print(f"❌ SMTP Server Disconnected: {e}")
    
except smtplib.SMTPException as e:
    print(f"❌ SMTP Error: {e}")
    
except Exception as e:
    print(f"❌ General Error: {type(e).__name__} - {e}")

print("-" * 50)
print("SMTP test completed.")