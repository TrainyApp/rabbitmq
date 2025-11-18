FROM alpine AS plugin-installer

RUN apk add curl
ENV PLUGIN_VERSION=4.2.0 
RUN curl -L -o rabbitmq_delayed_message_exchange.ez \
  https://github.com/rabbitmq/rabbitmq-delayed-message-exchange/releases/download/v${PLUGIN_VERSION}/rabbitmq_delayed_message_exchange-${PLUGIN_VERSION}.ez

FROM rabbitmq:4.2.1-management-alpine

COPY --from=plugin-installer rabbitmq_delayed_message_exchange.ez /opt/rabbitmq/plugins
RUN rabbitmq-plugins enable rabbitmq_delayed_message_exchange
