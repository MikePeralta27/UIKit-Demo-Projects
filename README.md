# UIKit Demo Projects

A monorepo of small UIKit sample apps and experiments. Each original GitHub project lives in a **top-level folder** at the repo root with its history preserved.

## Repositories

| Folder | Description |
|--------|-------------|
| [`I-am-Rich/`](I-am-Rich/) | “I am Rich” demo app — [source repo](https://github.com/MikePeralta27/I-am-Rich) |
| [`I-Am-Poor/`](I-Am-Poor/) | “I Am Poor” demo app — [source repo](https://github.com/MikePeralta27/I-Am-Poor) |
| [`Magic-8-Ball-iOS13/`](Magic-8-Ball-iOS13/) | Magic 8 Ball (iOS 13 / storyboard-style demo) — [source repo](https://github.com/MikePeralta27/Magic-8-Ball-iOS13) |
| [`Xylophone-iOS13/`](Xylophone-iOS13/) | Xylophone keys with sounds (iOS 13 / UIKit demo) — [source repo](https://github.com/MikePeralta27/Xylophone-iOS13) |
| [`Calculator-Layout-iOS13/`](Calculator-Layout-iOS13/) | Calculator UI layout (iOS 13 / storyboard) — [source repo](https://github.com/MikePeralta27/Calculator-Layout-iOS13) |
| [`EggTimer-iOS13/`](EggTimer-iOS13/) | Egg timer / countdown demo (iOS 13) — [source repo](https://github.com/MikePeralta27/EggTimer-iOS13) |
| [`Quizzler-LayoutPractice-iOS13/`](Quizzler-LayoutPractice-iOS13/) | Quiz app layout practice (iOS 13) — [source repo](https://github.com/MikePeralta27/Quizzler-LayoutPractice-iOS13) |
| [`Destini-iOS13/`](Destini-iOS13/) | Choose-your-own-adventure style story app (iOS 13) — [source repo](https://github.com/MikePeralta27/Destini-iOS13) |
| [`BMI-Calculator-iOS13/`](BMI-Calculator-iOS13/) | BMI calculator (iOS 13) — [source repo](https://github.com/MikePeralta27/BMI-Calculator-iOS13) |
| [`Tipsy-iOS13/`](Tipsy-iOS13/) | Tip calculator / bill splitter (iOS 13) — [source repo](https://github.com/MikePeralta27/Tipsy-iOS13) |
| [`Clima-iOS13/`](Clima-iOS13/) | Weather app (API, location, dark mode) — [source repo](https://github.com/MikePeralta27/Clima-iOS13) |
| [`ByteCoin-iOS13/`](ByteCoin-iOS13/) | Crypto price tracker (CoinAPI-style demo) — [source repo](https://github.com/MikePeralta27/ByteCoin-iOS13) |
| [`Flash-Chat-IOS/`](Flash-Chat-IOS/) | Chat UI (CocoaPods; Firebase-style course project) — [source repo](https://github.com/MikePeralta27/Flash-Chat-IOS) |
| [`H4cking-News/`](H4cking-News/) | Hacker News–style feed (Swift) — [source repo](https://github.com/MikePeralta27/H4cking-News) |
| [`MichaelCard/`](MichaelCard/) | Personal “business card” style app — [source repo](https://github.com/MikePeralta27/MichaelCard) |
| [`Dice-SwiftUI/`](Dice-SwiftUI/) | Dice roller (SwiftUI) — [source repo](https://github.com/MikePeralta27/Dice-SwiftUI) |
| [`I-am-Rich-SwiftUI/`](I-am-Rich-SwiftUI/) | “I am Rich” (SwiftUI) — [source repo](https://github.com/MikePeralta27/I-am-Rich-SwiftUI) |
| [`Todoey-IOS16/`](Todoey-IOS16/) | Todo list (iOS 16; persistence demo) — [source repo](https://github.com/MikePeralta27/Todoey-IOS16) |
| [`Agenda-IOS16/`](Agenda-IOS16/) | Agenda / notes-style app (iOS 16) — [source repo](https://github.com/MikePeralta27/Agenda-IOS16) |
| [`AutoLayout-iOS13/`](AutoLayout-iOS13/) | Auto Layout practice (iOS 13) |
| [`Calculator-Advanced-Swift-iOS13/`](Calculator-Advanced-Swift-iOS13/) | Advanced Swift calculator (iOS 13) |
| [`CoreDataTest/`](CoreDataTest/) | Core Data scratch / test app |
| [`InspoQuotes-iOS13/`](InspoQuotes-iOS13/) | Inspirational quotes demo (iOS 13) |
| [`SeaFood1/`](SeaFood1/) | SeaFood / image-classification style UIKit demo |

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
