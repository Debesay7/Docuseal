# Use the official DocuSeal image directly
FROM docuseal/docuseal:1.7.2

# Railway will automatically set PORT environment variable
# DocuSeal should respect it, but if not, it runs on 8080 by default
# Updated for email fix - force restart v2