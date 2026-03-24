# UIKit Demo Projects

A monorepo of small UIKit sample apps and experiments. Each original GitHub project lives in a **top-level folder** at the repo root with its history preserved.

## Repositories

| Folder | Description |
|--------|-------------|
| [`I-am-Rich/`](I-am-Rich/) | “I am Rich” demo app — [source repo](https://github.com/MikePeralta27/I-am-Rich) |
| [`I-Am-Poor/`](I-Am-Poor/) | “I Am Poor” demo app — [source repo](https://github.com/MikePeralta27/I-Am-Poor) |
| [`Magic-8-Ball-iOS13/`](Magic-8-Ball-iOS13/) | Magic 8 Ball (iOS 13 / storyboard-style demo) — [source repo](https://github.com/MikePeralta27/Magic-8-Ball-iOS13) |

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
