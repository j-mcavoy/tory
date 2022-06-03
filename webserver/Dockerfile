FROM elixir:latest

RUN mix local.hex --force
RUN mix local.rebar --force
RUN mix deps.get

COPY . /app
WORKDIR /app

COPY ./docker-entrypoint.sh /docker-entrypoint.sh
RUN chmod +x /docker-entrypoint.sh
ENTRYPOINT [ "/docker-entrypoint.sh" ]
EXPOSE 4000
