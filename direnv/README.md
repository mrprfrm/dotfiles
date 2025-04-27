# direnv

Global **direnv.toml** enables seamless `.env` loading.

## Defaults

- `load_dotenv = true` – treat plain `.env` like `.envrc`.

## Example templates

```
examples/
├── python.envrc   # layout python && pip install -r requirements.txt
└── node.envrc     # use nodenv 20.11.1
```

Copy desired file to project root and tweak.
