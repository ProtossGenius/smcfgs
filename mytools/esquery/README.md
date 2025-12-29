# esquery

A simple Elasticsearch query CLI tool using `curl` and `vim`.

## Features
- Environment-based configuration (`~/.config/esenv/*.env`).
- Interactive query body editing with `vim`.
- Tab completion for environments, indices, and commands.
- `fzf` integration for index selection.
- Vim snippets for common ES queries.

## Installation

```bash
curl -sSL https://raw.githubusercontent.com/ProtossGenius/smcfgs/master/mytools/esquery/install.sh | bash
```

## Uninstallation

```bash
curl -sSL https://raw.githubusercontent.com/ProtossGenius/smcfgs/master/mytools/esquery/uninstall.sh | bash
```

## Usage

1. Create an environment file in `~/.config/esenv/dev.env`:
   ```bash
   ES_HOST="http://localhost:9200"
   ES_USER="admin"
   ES_PASS="password"
   ```

2. Run query:
   ```bash
   esquery dev /my-index/_search
   ```

3. If the command requires a body (like `_search`), `vim` will open. You can use the provided snippets if you have a snippet engine configured to load `es.snippets`.

## Configuration
Commands and their HTTP methods are defined in `commands.conf`.
