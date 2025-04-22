FROM alpine AS plugin-installer

RUN apk add curl
RUN curl -L -o rabbitmq_delayed_message_exchange.ez https://github.com/rabbitmq/rabbitmq-delayed-message-exchange/releases/download/latest/rabbitmq_delayed_message_exchange-4.1.0.ez

FROM rabbitmq:4.1.0-management-alpine

COPY --from=plugin-installer rabbitmq_delayed_message_exchange.ez /opt/rabbitmq/plugins
RUN rabbitmq-plugins enable rabbitmq_delayed_message_exchange
