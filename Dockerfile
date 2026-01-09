# Use the official DocuSeal image directly
FROM docuseal/docuseal:1.7.2

# Add database reset script
COPY reset-database.rb /app/reset-database.rb

# Force database reset on startup if environment variable is set
RUN echo '#!/bin/bash\nif [ "$FORCE_DB_RESET" = "true" ]; then\n  cd /app && bundle exec rails runner reset-database.rb\nfi\nexec "$@"' > /app/reset-entrypoint.sh && chmod +x /app/reset-entrypoint.sh

# Railway sets PORT environment variable, but DocuSeal expects it on port 3000
# We'll let DocuSeal run on its default port and Railway will handle the mapping
# Updated for database reset - force restart v4

ENTRYPOINT ["/app/reset-entrypoint.sh"]