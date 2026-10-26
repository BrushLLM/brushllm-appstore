# BrushLLM

## Introduction

BrushLLM is an enterprise AI gateway: one API key for every model. OpenAI,
Anthropic, Gemini, DeepSeek, Qwen and other major model services behind a
unified API, unified billing, and unified auditing.

- **Multi-protocol**: OpenAI Chat / Responses, Anthropic Messages, and Gemini
  native protocols with cross-conversion
- **Channel routing**: model mapping, priority weights, retries, channel
  affinity
- **Usage & costs**: quota management, subscriptions, usage logs,
  expression-based pricing
- **Access control**: user groups, fine-grained permissions, OAuth/OIDC,
  two-factor authentication
- **Console**: 11 languages, light/dark themes, built-in playground

Runs out of the box with built-in SQLite in a single container; the install
form can switch to external MySQL / PostgreSQL and Redis for multi-node
deployments.

## Installation

After installing from the 1Panel app store, open `http://server-ip:port` to
complete the setup wizard (create the administrator account). The API base
URL is `http://server-ip:port/v1`.

## Open-source attribution

This project is a customized fork of
[New API](https://github.com/QuantumNous/new-api) (AGPLv3). Frontend design
and development by the New API contributors.
