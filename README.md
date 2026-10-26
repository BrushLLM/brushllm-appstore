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

Defaults work out of the box (built-in SQLite, single container). Optional
external database / Redis:

| Parameter | Default | Notes |
|---|---|---|
| Web port | 3000 | Port conflicts auto-detected |
| Timezone | Asia/Shanghai | |
| Session secret | auto-generated | Must match across nodes |
| External DB DSN | empty | Empty = built-in SQLite; MySQL / PostgreSQL DSN supported |
| Redis connection | empty | Recommended for multi-node |

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
├── 1.0.0-rc.47/          # pinned version (image tag v1.0.0-rc.47)
│   ├── data.yml          # install form
│   ├── docker-compose.yml
│   ├── data/             # SQLite persistence
│   └── logs/
└── latest/               # floating tag
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
