# BrushLLM 1Panel App Store

Third-party app source for [1Panel v2](https://1panel.pro) providing
[BrushLLM](https://brushllm.com), the enterprise AI gateway. Ships the
official Docker Compose app package (data.yml format) via the "local apps"
mechanism of the 1Panel community edition.

## Install (3 steps)

**1. Run the one-line importer on your 1Panel server:**

```bash
bash <(curl -sL https://github.com/BrushLLM/brushllm-appstore/raw/main/install.sh)
```

> If 1Panel is installed outside `/opt`:
> `PANEL_BASE_DIR=/your/path bash <(curl -sL ...)`

**2. Open 1Panel → App Store → click "Sync Local Apps"**

**3. Find BrushLLM (Local tag) in the list → Install**

Three variants are published per release — pick one in the version dropdown:

| Variant | Database | Redis | For |
|---|---|---|---|
| `1.0.0-rc.47` (default) | built-in SQLite | none | Single node, zero extra services |
| `1.0.0-rc.47-postgres` | PostgreSQL (1Panel app) | 1Panel Redis app | Production / multi-node |
| `1.0.0-rc.47-mysql` | MySQL (1Panel app) | 1Panel Redis app | Production / multi-node |
| `latest` | built-in SQLite | none | Tracks the newest image |

The default variant asks only for web port, timezone, and session secret.
The database variants follow the 1Panel dependency pattern: select the
PostgreSQL/MySQL and Redis apps already installed in your panel from
dropdowns — host, port, and credentials are wired automatically and the
database/user are provisioned for you.

Common parameters:

| Parameter | Default | Notes |
|---|---|---|
| Web port | 3000 | Port conflicts auto-detected |
| Timezone | Asia/Shanghai | |
| Session secret | auto-generated | Must match across nodes |

> Switching between variants (e.g. SQLite -> PostgreSQL) does not migrate
> data; pick the right variant for a fresh install or migrate manually.

## Upgrade

1. Wait for a new version directory under `apps/brushllm/` in this repo
2. Re-run the importer script
3. "Sync Local Apps" → the installed app shows "Upgradable" → upgrade

Upgrades preserve `data/` (SQLite database) and `logs/` automatically;
pre-upgrade backups can be enabled in App Store settings.

Users on the `latest` version can pull the newest image via "Rebuild" on the
app detail page.

## Repository layout

```
apps/brushllm/
├── data.yml              # app metadata
├── logo.png
├── README.md / README_en.md
├── 1.0.0-rc.47/          # SQLite variant (image tag v1.0.0-rc.47)
│   ├── data.yml          # install form
│   ├── docker-compose.yml
│   ├── data/             # SQLite persistence
│   └── logs/
├── 1.0.0-rc.47-postgres/ # PostgreSQL + Redis variant (1Panel app dependency)
├── 1.0.0-rc.47-mysql/    # MySQL + Redis variant (1Panel app dependency)
└── latest/               # SQLite variant, floating tag
```

## Versioning

BrushLLM is a customized fork of
[QuantumNous/new-api](https://github.com/QuantumNous/new-api) (AGPLv3).
Version numbers track upstream releases (currently `v1.0.0-rc.47`) to ease
future upgrades. Images are published at
`ghcr.io/brushllm/brushllm-newapi`; corresponding source lives in the
[brushllm-newapi repository](https://github.com/BrushLLM/brushllm-newapi).

## License & attribution

This app embeds AGPLv3-licensed upstream code. Frontend design and
development by the New API contributors — original project:
https://github.com/QuantumNous/new-api
