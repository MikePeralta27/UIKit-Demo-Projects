# UIKit Demo Projects

A monorepo of small UIKit sample apps and experiments. Each original GitHub project lives in a **top-level folder** at the repo root with its history preserved.

## Repositories

| Folder | Description |
|--------|-------------|
| [`I-am-Rich/`](I-am-Rich/) | “I am Rich” demo app — [source repo](https://github.com/MikePeralta27/I-am-Rich) |
| [`I-Am-Poor/`](I-Am-Poor/) | “I Am Poor” demo app — [source repo](https://github.com/MikePeralta27/I-Am-Poor) |
| [`Magic-8-Ball-iOS13/`](Magic-8-Ball-iOS13/) | Magic 8 Ball (iOS 13 / storyboard-style demo) — [source repo](https://github.com/MikePeralta27/Magic-8-Ball-iOS13) |
| [`Xylophone-iOS13/`](Xylophone-iOS13/) | Xylophone keys with sounds (iOS 13 / UIKit demo) — [source repo](https://github.com/MikePeralta27/Xylophone-iOS13) |

## Layout

- **`<RepoName>/`** — one directory per imported repository, directly under the monorepo root (sibling to this `README.md`).

## Adding a demo (branch + pull request)

Each new demo should land via a **short-lived branch** and a **pull request** into `main`, with a **brief** PR description (what the demo shows, folder name, optional source link). GitHub will suggest [`.github/pull_request_template.md`](.github/pull_request_template.md).

```bash
git checkout main && git pull origin main
git checkout -b add/<FolderName>

# SSH URL avoids HTTPS auth prompts for GitHub
git remote add <shortname> git@github.com:MikePeralta27/<Repo>.git
git fetch <shortname>
git subtree add --prefix=<FolderName> <shortname>/main   # or master; use local ref to skip extra fetch
git remote remove <shortname>

# Update the table in README.md, then:
git add README.md
git commit -m "Document <FolderName> in README"
git push -u origin add/<FolderName>
gh pr create --base main --title "Add <FolderName> demo" --body "Short note about what this demo shows."
```

## Importing another repo (history preserved)

Subtree details (same as above, without the branch/PR steps):

```bash
git remote add <shortname> <repo-url>
git fetch <shortname>
git subtree add --prefix=<FolderName> <shortname> <branch>
git remote remove <shortname>
```

Example: repo `ScrollViewPlayground`, default branch `main`:

```bash
git subtree add --prefix=ScrollViewPlayground scrollview main
```

Use the source repo’s default branch (`main` or `master`) instead of `<branch>`. Omit `--squash` to keep full history.
