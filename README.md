# Taskit

Taskit (said Task-kit or TK for short) is the Masterpoint [Taskfile](https://taskfile.dev/) Kit. We utilize this set of Taskfiles across clients as a means by which to share repeatable tasks like repo setup, tool automation, and similar shared scripting.

## Using Taskit

Taskit is built around the idea of being consumed by downstream repos. It is pulled through a standard Taskfile that you can find in [`exports/Taskfile.dist.yaml`](./exports/Taskfile.dist.yaml).

The procedure to add it to a project is to do the following:

1. Copy `exports/Taskfile.dist.yaml` to your project.
2. Add the following lines to your project's `.gitignore`:

   ```gitignore
   .taskit/
   .task/
   .snaplet/snapshots/
   ```

3. Run `task init` to initialize taskit by downloading this repo into your remote repo. Note, `git` is a requirement.
4. Run `task --list` to list all newly available tasks from taskit.
5. (Optional) Add a `.env.taskit` file which can include overrides for any variables in taskit.

## TODO

- [ ] Create a test harness + tests around tasks
- [ ] Upstream various tasks from our distributed usage
- [ ] Publish versions
