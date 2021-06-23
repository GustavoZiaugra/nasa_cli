FROM elixir:1.11.3
RUN mkdir /nasa
WORKDIR /nasa
RUN mix local.hex --force
RUN mix local.rebar --force
COPY . .
RUN mix deps.get
RUN mix escript.build
