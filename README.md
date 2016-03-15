# calfresh-conversion-experiment

A tiny web app to facilitate measuring CalFresh application conversion on legacy systems and our own site (GetCalFresh)

## Status

Work in progress

## Local setup

- Install dependencies with `bundle install`
- Start your local Postgres instance and set env vars to acccess it: `POSTGRES_USERNAME` and `POSTGRES_PASSWORD`
- Create database and migrate: `bin/rake db:create` then `bin/rake db:migrate`

## License

MIT
