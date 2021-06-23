## How to build the CLI with Docker

1. Run
```
docker build --tag nasa .
```

2. Access the container
```
docker run -it nasa bash
```

## How to build the CLI without Docker
1. Install **Elixir** version **1.11.3** (Oficial documentation).
```
https://elixir-lang.org/install.html
```
2. Install **Erlang** version **22.0.7** (Oficial documentation).
```
https://erlang.org/doc/installation_guide/INSTALL.html
```

3. Move to the repository directory
```
cd nasa
```

4. Install dependencies
```
mix deps.get
```

5. Build the app
```
mix escript.build
```

## Running CLI:
```
./nasa < test/nasa/fixtures/template_file.txt
```

If you need some help you can run:
```
./nasa --help
```

## Running Tests
Into the project directory
```
mix test
```
