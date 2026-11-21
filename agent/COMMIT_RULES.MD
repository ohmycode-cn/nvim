# Commit Rules

Mandatory discipline for every commit in this repository.

## Golden Rule

> Every commit is a **log event**.
> Write the log, lock the files, get permission — **then** push.

## Commit Checklist

```
[ ] 1. Verify changes work (nvim --headless / bash -n)
[ ] 2. Write log entry (log/<YYYY-MM-DD-HH-MM-SS>.txt)
[ ] 3. Lock log files: bash flock.sh lock
[ ] 4. Stage specific files (git add <file>... — never -A)
[ ] 5. Commit with inline git identity
[ ] 6. ASK USER for push permission
[ ] 7. Push (only after explicit approval)
```

## Log Format

One consolidated log file per day: `log/<YYYY-MM-DD-HH-MM-SS>.txt`
(earliest timestamp of the day is the filename).

Each entry:

```
[YYYY-MM-DD-HH-MM-SS]
- First change
- Second change
```

Multiple entries in one file are separated by a blank line:

```
[2026-11-17-21-55-56]
- Added 7 new themes
- Updated docs

[2026-11-17-22-17-24]
- Filled doc/dependencies.ini
```

## Lock / Unlock

`flock.sh` controls write permission on `log/*.txt`:

```bash
bash flock.sh lock     # chmod u-w log/*.txt  (default)
bash flock.sh unlock   # chmod u+w log/*.txt  (before writing)
```

- **Always unlock before writing a log entry.**
- **Always lock before committing.**
- Logs are locked after write to prevent accidental edits.

## Commit Message

- Short imperative summary (50 chars preferred, 72 max).
- Focus on **why**, not just what.
- Examples:
  - `Enable rust-analyzer LSP, add colorcolumn 80`
  - `Move clangd.lua into lspc/, fix require paths`
  - `Match nvim background to Termux colors`

## Git Identity

Global git identity is **not** configured on this device.
Author info lives in two files:

| File | Tracked | Role |
|------|---------|------|
| `author.storehouse.ini` | yes | Archive — authoritative author info |
| `author.submit.ini` | **no** (gitignored) | Submit credential — read this for commits |

**Read author info from `author.submit.ini`:**

```
USER=ohmycode-cn
MAIL=ohcode@163.com
```

**Always use inline identity with these values:**

```bash
git -c user.name="${USER}" -c user.email="${MAIL}" commit -m "<message>"
```

Example:

```bash
git -c user.name="ohmycode-cn" -c user.email="ohcode@163.com" commit -m "<message>"
```

**Do NOT hardcode or guess the email.** Read `author.submit.ini`.
`author.storehouse.ini` is the source of truth — if `author.submit.ini`
is empty or missing, copy the values from `author.storehouse.ini`.

## Staging

- Stage **specific files** by name: `git add <file1> <file2> ...`
- **Never** use `git add -A`, `git add .`, or `-uall`.
- Avoid staging secrets (`.env`, `*.pem`, `*.key`) or `pkg/` (ignored).

## Push Permission

Push is **never** automatic. Ask the user:

> Committed (`<hash>`). Allow push?

Or in batch:

> Commit `<hash>` is ready. Push to GitHub?

Push only after the user explicitly approves.

## What NEVER to Do

- Never `git push --force` (unless user explicitly requests it)
- Never `git reset --hard`
- Never `--no-verify` / `--no-gpg-sign` to skip hooks
- Never amend a commit (unless user requests AND it is your own unpushed commit)
- Never update `git config`
- Never commit secrets or `pkg/`
- Never gitignore `log/` — it IS tracked

## Daily Log Consolidation

End of day: merge that day's entries into one file (see `WORKFLOW.MD`).
Only touch logs from the target day — never delete other days' files.
