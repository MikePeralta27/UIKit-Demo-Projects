# UIKit Demo Projects

A monorepo of small UIKit sample apps and experiments. Each original GitHub project lives in a **top-level folder** at the repo root with its history preserved.

## Repositories

| Folder | Description |
|--------|-------------|
| *(none yet — add rows as subtrees are merged)* | |

## Layout

- **`<RepoName>/`** — one directory per imported repository, directly under the monorepo root (sibling to this `README.md`).

## Importing another repo (history preserved)

From the monorepo root, use the folder name you want at root (often the same as the GitHub repo name):

```bash
git remote add <shortname> <repo-url>
git fetch <shortname>
git subtree add --prefix=<shortname> <shortname> <branch>
git remote remove <shortname>
```

Example: if the repo is `ScrollViewPlayground` and its default branch is `main`:

```bash
git subtree add --prefix=ScrollViewPlayground scrollview main
```

Use the source repo’s default branch (`main` or `master`) instead of `<branch>`. Omit `--squash` to keep full history.
