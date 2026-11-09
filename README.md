# release-poc-app

Application **app** of the release PoC. Code, tests and a Dockerfile; everything else comes from the central templates in [release-poc-deployment](https://github.com/christianlehnert/release-poc-deployment#readme).

| Branch | What happens |
|---|---|
| `feature/*`, `bugfix/*`, `hotfix/*` | pull request into `main`; quality gates must pass; every push is a preview on DEV |
| `main` (protected) | every merge builds the image once and deploys it to DEV |
| `releases/x.y` | only when PROD needs a fix while main is ahead; fixes are forward-ported to main by the bot |
| `scope/*` | long-running scope that must not go to PROD; the bot keeps it in sync with main |

A published release (`release/x.y.z`) retags the image built for that commit and goes to TEST, then PROD.
