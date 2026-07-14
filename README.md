# skills

Persoonlijke verzameling [Claude Code](https://claude.com/claude-code) skills.

Elke skill staat in een eigen map met een `SKILL.md`. De frontmatter (`name`, `description`) bepaalt wanneer de skill wordt aangeboden.

## Skills

| Skill | Omschrijving |
| --- | --- |
| [`mendix-challenge`](./mendix-challenge/SKILL.md) | Interviewt de developer één vraag tegelijk om een Mendix-idee, story of beslissing scherp te krijgen vóór er gebouwd wordt. Planning-only. |
| [`mendix-plan`](./mendix-plan/SKILL.md) | Zet een Mendix-input (idee, story, bug, feature) om in een concreet ontwikkelplan van één of meer stories in markdown. Scherpt de input eerst via `mendix-challenge`. Planning-only. |

## Installeren

### Aanbevolen: linken (Windows)

Draai `link-skills.ps1`. Dit maakt een junction voor elke skillmap in
`~/.claude/skills/`, zodat de repo de enige bron blijft — wat je hier bewerkt en
pusht is direct actief als skill. Geen admin-rechten nodig.

```powershell
./link-skills.ps1          # linkt alle skills uit deze repo
./link-skills.ps1 -Force   # overschrijft ook bestaande echte mappen
```

Voeg je later een nieuwe skillmap toe? Draai het script nog eens; bestaande
junctions worden ververst en nieuwe erbij gelinkt.

### Alternatief: kopiëren

```bash
cp -r mendix-plan mendix-challenge ~/.claude/skills/
```

Start daarna een nieuwe Claude Code-sessie zodat de skills worden ingeladen.
