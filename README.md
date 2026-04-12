# .sm-welcome

Executive onboarding bootstrap for SimpleMotion. Sets up Claude Code, gh CLI, Rust, and the full plugin environment on a fresh Mac with a single command.

## Usage

```bash
curl -fsSL https://simplemotion.com/welcome.sh | bash
```

## What it does

The script asks for your **SimpleMotion email** and infers everything else:

```
Email:  joy.yeoh@simplemotion.com
  ├─→ Name:     Joy Yeoh
  ├─→ GitHub:   Joy-Yeoh-SM
  └─→ Repo:     auto-discovered in SimpleMotion-9200-0000-00-Employees
```

### Installs

| Tool | Version | Location |
|------|---------|----------|
| Claude Code | Latest | System PATH |
| gh CLI | Latest release | `~/.local/bin/` |
| Rust (rustup) | Stable | `~/SimpleMotion/.cargo/bin/` |

### Configures

| What | Where | How |
|------|-------|-----|
| Git identity | `~/.gitconfig` | Symlink → `.userconfig/.gitconfig` |
| Shell (zsh) | `~/.zshrc`, `~/.zshenv` | Symlink → `.userconfig/` |
| Claude Code settings | `~/.claude/settings.json` | Symlink → `.userconfig/.claude/` |
| Claude Code rules | `~/.claude/CLAUDE.md` | Symlink → `.userconfig/.claude/` |
| MCP servers | `~/.claude/.mcp.json` | Symlink (all disabled initially) |
| Plugin marketplaces | `~/.claude/plugins/` | Symlink (simplemotion + simpleglobal) |
| gh CLI config | `~/.config/gh/` | Copied (not symlinked — auth tokens) |
| Global gitignore | `~/.config/git/ignore` | Copied |

### Sends

A welcome confirmation email via Microsoft 365 Graph API (GitHub Actions workflow).

## Post-setup

After the script completes, open a new terminal:

```bash
sm                          # Launch Claude Code in ~/SimpleMotion
/sm-orgs --sync-folders     # Pull org folder structure
/sm-mcp --auth              # Authenticate MCP integrations (when ready)
```

## Admin: onboarding a new executive

Before giving the new exec the curl command:

1. Create their GitHub account (pattern: `Firstname-Lastname-SM`)
2. Invite them to the `simplemotion-global` enterprise
3. Create their employee repo:

```bash
gh repo create SimpleMotion-9200-0000-00-Employees/9200-XXXX-SM-Firstname-Lastname \
  --template SimpleMotion-9900-0000-00-Templates/990002-SG-99-SimpleMotion-Folder \
  --internal \
  --description "Employee home directory for Firstname Lastname"
```

4. Share the curl command with the new exec.

## Architecture

See [docs/WORKFLOW.md](docs/WORKFLOW.md) for full design rationale, config file details, and symlink conventions.

## Prerequisites

- macOS (Darwin)
- Internet access
- Git (pre-installed with Xcode Command Line Tools)

## License

MIT — SimpleMotion.Global Pty Ltd. See [ASSIGN.md](ASSIGN.md).
