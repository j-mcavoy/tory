# tory

An inventory management web app written in [Elixir](https://elixir-lang.org/) [Phoenix](https://www.phoenixframework.org/) framework (inspired by [PartKeepr](https://github.com/partkeepr/PartKeepr))

## Running

### Docker Compose (recommended)

0. install [docker-compose](docker-compose) and [elixir](https://elixir-lang.org/) and [Phoenix framework](https://www.phoenixframework.org/)
1. `git clone https://gitlab.com/j-mcavoy/tory.git`
2. `cd tory`
3. change `PORT`, `DB_PASSWORD`, `SECRET_KEY_BASE` in `.env` to your liking
4. `docker-compose up -d`
5. Then go to `localhost:${PORT}` in your web browser (http://localhost:80 by default)

## Development

0. install [docker-compose](docker-compose) and [elixir](https://elixir-lang.org/) and [Phoenix framework](https://www.phoenixframework.org/)

1. ```bash
   git clone https://gitlab.com/j-mcavoy/tory.git
   cd tory/webserver
   docker-compose up -d db
   mix deps.get
   mix ecto.setup
   iex -S mix phx.server
   ```

2. go to http://localhost:4000/ in your web browser
