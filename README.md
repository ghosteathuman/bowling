# Bowling

This Rails app intents to implement a ten-pin bowling scoring service.

## ARCHIVED

This app is now **ARCHIVED** and will not be updated.

MIT license applies to the archived code without prejudice.

## Getting Ready

- [Ruby 3.1](https://www.ruby-lang.org/en/downloads/) required.

## Getting Started

1. Clone this project.
2. Install dependencies with:
```bash
$ bundle install
```

## Using Docker Compose

Docker Compose can be used to setup the PostgreSQL and Redis instance for local development.

Run the command:
```bash
$ docker-compose up -d
```
## Decision Log

### Score Calculation Algorithm

After several rounds of testing, I will note that the algorithm might have some odd (but accurate) result
which will correct itself at the end of game.

The calculation caters for scores being streamed in, rather than knowing all the scores in advance,
which requires different calculation method to cater for different scenarios.

I will note that while it is possible to perform exhautive testing against every permutation of bowling
scores to ensure the calculation algorithm is accurate, I did not do so and only opt-ed for selective 
testing.
### Usage of Kredis
Kredis was added into the project and used to score the game score and scores per frame
due to the requirements of an API constantly requesting for scores.
Using an in-memory data store will allows for quicker response for the API and
will reduce the bottleneck on disk read / write from the database.

## Rails Creation Command
```
rails new bowling --api -d postgresql -skip-action-cable --skip-action-mailbox --skip-action-mailer --skip-action-text --skip-active-storage --skip-keeps --skip-turbolinks

```
