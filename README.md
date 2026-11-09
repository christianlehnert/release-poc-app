# release-poc-app

Application of the release PoC, with the branch model of a real app:

- `main`: development of the next version
- `releases/x.y`: what runs in PROD. Fixes for PROD are merged here and released from here

Workflows:

| Workflow | When | What |
|---|---|---|
| Release Tag | a release is published (from main or a release branch) | the release bot writes `app_tag` into the collecting pull request of config-test |
| Forward-port to main | something is pushed to `releases/**` | the bot cherry-picks the new commits onto main and opens the pull request |
| Simulate releases of other apps | by hand | stands in for the other application repositories of a full release |

The whole flow: [release-poc-deployment](https://github.com/christianlehnert/release-poc-deployment#readme).
