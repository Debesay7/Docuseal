# Use the official DocuSeal image directly
FROM docuseal/docuseal:1.7.2

# Set environment variables for Railway compatibility
ENV RAILS_ENV=production
ENV PORT=3000

# Expose the port
EXPOSE $PORT

# DocuSeal runs on port 3000 by default, which matches Railway's expectation