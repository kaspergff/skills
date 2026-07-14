# skills

Persoonlijke verzameling [Claude Code](https://claude.com/claude-code) skills.

Elke skill staat in een eigen map met een `SKILL.md`. De frontmatter (`name`, `description`) bepaalt wanneer de skill wordt aangeboden.

## Skills

| Skill | Omschrijving |
| --- | --- |
| [`mendix-challenge`](./mendix-challenge/SKILL.md) | Interviewt de developer één vraag tegelijk om een Mendix-idee, story of beslissing scherp te krijgen vóór er gebouwd wordt. Planning-only. |
| [`mendix-plan`](./mendix-plan/SKILL.md) | Zet een Mendix-input (idee, story, bug, feature) om in een concreet ontwikkelplan van één of meer stories in markdown. Scherpt de input eerst via `mendix-challenge`. Planning-only. |

## Installeren

Kopieer of symlink een skillmap naar je persoonlijke skills-directory:

```bash
# per skill
cp -r mendix-plan ~/.claude/skills/
cp -r mendix-challenge ~/.claude/skills/
```

Op Windows (PowerShell):

```powershell
Copy-Item mendix-plan      "$env:USERPROFILE\.claude\skills\" -Recurse
Copy-Item mendix-challenge "$env:USERPROFILE\.claude\skills\" -Recurse
```

Herstart Claude Code (of start een nieuwe sessie) zodat de skills worden ingeladen.
