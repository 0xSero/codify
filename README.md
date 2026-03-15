# codify

Open any codebase in the browser with one command. A secure wrapper around [code-server](https://github.com/coder/code-server).

## Install

```sh
curl -fsSL https://raw.githubusercontent.com/0xSero/codify/main/install.sh | sh
```

Or clone and install manually:

```sh
git clone https://github.com/0xSero/codify.git
cd codify
make install
```

### Prerequisites

codify requires [code-server](https://github.com/coder/code-server):

```sh
brew install code-server          # macOS
curl -fsSL https://code-server.dev/install.sh | sh   # Linux/macOS
```

## Usage

```sh
codify                    # open current directory
codify ~/projects/myapp   # open a specific project
codify -p 9000 .          # custom port
codify --stop             # stop the running instance
codify --status           # check if running
```

## Security

codify is secure by default:

- Binds to `127.0.0.1` only (not reachable from network)
- No password required (localhost-only means no auth needed)
- Telemetry disabled
- Warns if you override the bind address

## Configuration

| Variable | Default | Description |
|---|---|---|
| `CODIFY_PORT` | `8443` | Port to serve on |
| `CODIFY_BIND` | `127.0.0.1` | Bind address (default is secure, never use 0.0.0.0) |

## Droid Integration

Drop the slash command into your Factory CLI:

```sh
cp bin/codify ~/.factory/commands/codify.sh
chmod +x ~/.factory/commands/codify.sh
```

Then use `/codify` in any Droid session.

## License

MIT
