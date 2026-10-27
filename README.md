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

The app uses the 1Panel dependency pattern: select the PostgreSQL and Redis
apps already installed in your panel from dropdowns — host, port, and
credentials are wired automatically, and the database/user are provisioned
for you. **Install the PostgreSQL and Redis apps from the 1Panel app store
first**, then install BrushLLM.

| Parameter | Default | Notes |
|---|---|---|
| Database service | — | Pick your installed PostgreSQL app |
| Database name / user / password | auto (random) | Provisioned automatically |
| Redis service | — | Pick your installed Redis app |
| Redis password | — | From your Redis app |
| Web port | 3000 | Port conflicts auto-detected |
| Timezone | Asia/Shanghai | |
| Session secret | auto-generated | Must match across nodes |

## Upgrade

1. Wait for a new version directory under `apps/brushllm/` in this repo
2. Re-run the importer script
3. "Sync Local Apps" → the installed app shows "Upgradable" → upgrade

Upgrades preserve the PostgreSQL data (managed by the database app) and
`logs/` automatically; pre-upgrade backups can be enabled in App Store
settings.

## Repository layout

```
apps/brushllm/
├── data.yml              # app metadata
├── logo.png
├── README.md / README_en.md
└── 1.0.0-rc.47-postgres/ # PostgreSQL + Redis (1Panel app dependency)
    ├── data.yml          # install form
    ├── docker-compose.yml
    ├── data/
    └── logs/
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
