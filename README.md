# memchain 🔗

**Tamper-evident hash chains for agent memory files.**

Nobody's building integrity verification for AI agent memory. Everyone's building better storage and retrieval. This is the missing layer.

## What it does

`memchain` creates a hash chain over your memory files. Each time you record a state, it includes the hash of the previous state — so any tampering with history is detectable.

Think git, but for agent memory integrity.

## Usage

```bash
# Initialize a new chain for a directory
memchain init ./memory

# Record current state of all tracked files
memchain record ./memory

# Verify the chain is intact (no tampering)
memchain verify ./memory

# Show chain history
memchain log ./memory
```

## How it works

1. **init** — Creates a `.memchain` file in the target directory
2. **record** — Hashes all tracked files, creates a new chain entry with `prev_hash + content_hash + timestamp`
3. **verify** — Walks the chain and confirms every link is valid
4. **log** — Shows the history of recorded states

## Chain format

```json
{
  "version": 1,
  "entries": [
    {
      "seq": 0,
      "timestamp": "2026-02-23T02:34:00Z",
      "files": { "2026-02-22.md": "sha256:abc123..." },
      "content_hash": "sha256:def456...",
      "prev_hash": null,
      "entry_hash": "sha256:ghi789..."
    }
  ]
}
```

## Why

Agent memory lives in markdown files. Those files define who the agent is. If someone (or something) modifies those files, the agent's identity changes — and currently, there's no way to detect that.

`memchain` is the first step toward cryptographic agent state verification.

## Status

v0.1 — Proof of concept. Works. Ships.

## License

MIT
