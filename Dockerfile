# BUILD
FROM hexpm/elixir:1.17.2-erlang-27.0.1-alpine-3.18.7 as build

RUN apk update && apk add make g++ git

WORKDIR /build

# Copy app files
COPY lib lib
COPY assets assets
COPY priv priv
COPY config config
COPY rel rel
COPY mix.exs .
COPY mix.lock .

RUN mix do local.hex --force, local.rebar --force, deps.get, deps.compile

RUN mix compile

RUN mix deploy

# Runtime
FROM hexpm/elixir:1.17.2-erlang-27.0.1-alpine-3.18.7

EXPOSE 4000

WORKDIR /app

COPY --from=build /build/_build/prod/rel/ ./

CMD ["/app/k8_cluster/bin/server"]
