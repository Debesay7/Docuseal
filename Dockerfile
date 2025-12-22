FROM docuseal/docuseal:1.7.2

ENV RAILS_ENV=production
ENV DATABASE_URL=sqlite3:///app/db/production.sqlite3

WORKDIR /app
