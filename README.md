# mu-project

Bootstrap a mu.semte.ch microservices environment in three easy steps.

## How to

Setting up your environment is done in three easy steps:  first you configure the running microservices and their names in `docker-compose.yml`, then you configure how requests are dispatched in `config/dispatcher.ex`, and lastly you start everything.

### Hooking things up with docker-compose

Alter the `docker-compose.yml` file so it contains all microservices you need.  The example content should be clear, but you can find more information in the [Docker Compose documentation](https://docs.docker.com/compose/).  Don't remove the `identifier` and `db` container, they are respectively the entry-point and the database of your application.  Don't forget to link the necessary microservices to the dispatcher and the database to the microservices.

### Configure the dispatcher

Next, alter the file `config/dispatcher.ex` based on the example that is there by default.  Dispatch requests to the necessary microservices based on the names you used for the microservice.

### Boot up the system

Boot your microservices-enabled system using docker-compose.

    cd /path/to/mu-project
    docker-compose up

You can shut down using `docker-compose stop` and remove everything using `docker-compose rm`.


# How to add this to any application

## Push updates in application

The steps to add push-updates to a mu-project initial stack

1. Make sure the identifier and dispatcher have websockets, for these a custom docker container is also availible at:
    - mu-identifier: semtech/mu-identifier:feature-ws
    - mu-dispatcher: semtech/mu-dispatcher:feature-ws
2. Generate push-updates in your service (e.g. [chat-backend example](https://github.com/redpencilio/chat-service/blob/master/app.js#L54))
    - For more information: [the semantic model](https://github.com/redpencilio/push-updates-service/blob/master/model.md)
3. Add [redpencilio/push-updates-service](https://github.com/redpencilio/push-updates-service) to the stack
4. Handle push-updates in the frontend by adding a callback function (e.g. [chat application](https://github.com/redpencilio/frontend-mu-push-poc-chat/blob/master/app/controllers/index.js#L16))


## Cache-clear push-updates

The steps to add cache-clear push-updates to a stack which has push-updates enabled

1. If you're using mu-cache, make sure you're using a version that writes cache-clear events to the database, for this a custom docker container is also availible at:
    - janpieterbaert/mu-cache:2.0.1
2. Make sure the cache is used by a resource
3. Make sure the [redpencilio/cache-clear-to-push-updates](https://github.com/redpencilio/cache-clear-to-push-update-service) service is availible in the stack
4. Subscribe to push-updates on cache-clear using the API (e.g. [cars example](https://github.com/redpencilio/frontend-mu-push-poc-cars/blob/master/app/controllers/index.js#L28))
5. Handle the push-updates on cache-clear (e.g. [cars example](https://github.com/redpencilio/frontend-mu-push-poc-cars/blob/master/app/controllers/index.js#L11))


## Ember addons:
There are two ember addons for this, they have the same functionality:
- [ember-wo-push-updates](https://github.com/redpencilio/ember-wo-push-updates): the long-polling version
- [ember-wo-push-updates-ws](https://github.com/redpencilio/ember-wo-push-updates-ws): the websocket version


An example of a stack using both push-updates and cache-clear push-updates is [app-mu-push-poc](https://github.com/redpencilio/app-mu-push-poc)
