# Trailblazer API
[![CircleCI](https://circleci.com/gh/jferrer/trailblazer-api/tree/master.svg?style=svg)](https://circleci.com/gh/jferrer/trailblazer-api/tree/master)

> Simple example of REST API built with Ruby on Rails & Trailblazer


### Starting the application

```bash
docker-compose up
```

### Migrating

```bash
docker-compose run api bin/rails db:migrate
```

### Testing

```bash
docker-compose run api bin/rails db:test:prepare # If the test database is not created
docker-compose run api bin/rails test
docker-compose run api bin/rails test test/concepts  # run tests for Traiblazer Operations
docker-compose run api bin/rails test test/integration  # run Integration Tests
```

### Database reset / re-seed
```bash
docker-compose down
rm -r docker/data-volume
docker-compose up db
# CTRL+C to shut down
docker-compose up
```
