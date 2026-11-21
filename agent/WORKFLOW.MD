# Task Execution Workflow

End-to-end process for any task in this repository.

## Overview

```
1. Understand  ->  2. Explore  ->  3. Change  ->  4. Verify
                                                      |
6. Push (with permission)  <-  5. Log + Lock + Commit
```

## Step 1: Understand the Task

- Read the user request carefully.
- If ambiguous, ask **before** changing files.
- Check `mimo-agent-task.txt` for a task book (user may assign tasks here).
- Check `agent/` docs for conventions relevant to the task.

## Step 2: Explore the Codebase

- Map the task to files: use `grep`, `glob`, `find`.
- Read existing files to match style and patterns (see `CODE_CONVENTIONS.MD`).
- For cross-file changes, check all consumers (e.g. `lsp.lua` loaders, docs).

**Key locations:**

| Area | Path |
|------|------|
| Entry point | `init.lua` |
| Core options / keymaps | `lua/core/` |
| Plugin + LSP config | `lua/opts/`, `lua/opts/lspc/` |
| Themes / UI overrides | `lua/pubs/`, `lua/pubs/theme/` |
| Dependency list | `doc/dependencies.ini` |
| Dir structure ref | `dirf_struct.txt` |
| Change logs | `log/` |
| Log lock helper | `flock.sh` |

## Step 3: Make Changes

- Match existing code style (see `CODE_CONVENTIONS.MD`).
- Keep changes minimal — no drive-by refactors, no extra abstractions.
- For new modules, wire them into the require chain (see `CODE_CONVENTIONS.MD`).
- Update docs **in the same change** when structure/behavior changes:
  - `dirf_struct.txt` (directory tree)
  - `README.MD` (features, structure, usage)
  - `doc/dependencies.ini` (if dependencies change)

## Step 4: Verify

- Run `nvim --headless` to check load errors.
- For Lua changes: `nvim --headless -c 'lua <check>; vim.cmd("qa!")'`.
- For syntax: `bash -n <script>.sh` for shell scripts.
- Confirm no errors in `:messages` output.

Example verification:

```bash
nvim --headless -c 'lua local ok, err = pcall(require, "core.keyboard"); print(ok and "OK" or ("ERR: " .. err)); vim.cmd("qa!")'
```

## Step 5: Log + Lock + Commit

**This is mandatory — see `COMMIT_RULES.MD` for full rules.**

1. Unlock logs: `bash flock.sh unlock`
2. Write log entry in `log/<YYYY-MM-DD-HH-MM-SS>.txt`:
   ```
   [YYYY-MM-DD-HH-MM-SS]
   - What changed (one bullet per change)
   ```
   If today's consolidated log already exists, append a new `[timestamp]` block.
3. Lock logs: `bash flock.sh lock`
4. Stage specific files (never `git add -A`).
5. Commit with inline identity from `author.submit.ini`:
   ```bash
   git -c user.name="${USER}" -c user.email="${MAIL}" commit -m "<message>"
   ```
   Read `USER` / `MAIL` from `author.submit.ini` (see `COMMIT_RULES.MD` Git Identity).

## Step 6: Push (Requires Permission)

**Ask the user before pushing.** Example:

> Committed (`<hash>`). Allow push?

Push only after explicit approval:

```bash
git push
```

## Daily Log Consolidation

At the end of a day, merge the day's log entries into one file:

1. `bash flock.sh unlock`
2. Create `log/<earliest-timestamp-of-day>.txt` with all entries:
   ```
   [timestamp-1]
   - entry...

   [timestamp-2]
   - entry...
   ```
3. Delete the other individual `.txt` files **for that day only** (never other days).
4. Lock, commit, push (with permission).

## Error Handling

- If a command fails, diagnose the root cause — do not retry blindly.
- If tests/verification fail, **report honestly** and keep the task open.
- Never use `git push --force`, `git reset --hard`, or `--no-verify`.
- Never amend a commit unless the user explicitly requests it.
