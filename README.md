# Taskit

Taskit (said task-kit or TK for short) is the Masterpoint [Taskfile](https://taskfile.dev/) Kit. We utilize this set of Taskfiles across clients as a means by which to share repeatable tasks like repo setup, tool automation, and similar shared scripting.

## Using Taskit

Taskit is built around the idea of being consumed by downstream repos. It is pulled through a standard Taskfile that you can find in [`exports/Taskfile.dist.yaml`](./exports/Taskfile.dist.yaml).

The procedure to add it to a project is to do the following:

1. Copy `exports/Taskfile.dist.yaml` to your project by running the following command:

   ```bash
   curl -sL https://raw.githubusercontent.com/masterpointio/taskit/main/exports/Taskfile.dist.yaml -o Taskfile.dist.yaml
   ```

1. Run `task init` to initialize taskit by downloading this repo into your remote repo.
   1. Note, `git` is a requirement.
1. Run `task --list` to list all newly available tasks from taskit.
1. (Optional) Add a `.env.taskit` file which can include overrides for any variables in taskit.
1. Now that the setup process for taskit is complete, you should commit and push the new configuration files to your repo. Well done 👏

## TODO

- [x] Upstream various tasks from our distributed usage
- [ ] Create a test harness + tests around tasks
- [ ] Publish versions
