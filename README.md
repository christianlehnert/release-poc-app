# release-poc-app

Application of the release PoC, with the branch model of a real app:

- `main`: development of the next version
- `releases/x.y`: what runs in PROD. Fixes for PROD are merged here and released from here
- `scope/<name>`: a long-running scope that must not go to PROD for months (developed and tested on TEST via previews)
- `feature/<name>`: short work branches; a push deploys a preview to TEST

Workflows:

| Workflow | When | What |
|---|---|---|
| Release Tag | a release is published (from main or a release branch) | the release bot writes `app_tag` into the collecting pull request of config-test |
| Forward-port to main | something is pushed to `releases/**` | the bot cherry-picks the new commits onto main and opens the pull request |
| Preview on TEST | push to `feature/**` or `scope/**` | deploys the branch build to TEST without a release; never promoted |
| Sync main into scope branches | push to `main` | the bot opens one merge pull request per `scope/**` branch, so it keeps the PROD fixes |
| Simulate releases of other apps | by hand | stands in for the other application repositories of a full release |

Merge chain done by the bot: `releases/x.y` → `main` → `scope/*`.

The whole flow: [release-poc-deployment](https://github.com/christianlehnert/release-poc-deployment#readme).
