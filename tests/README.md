# Taskit Test Suite

BATS test suite for Taskit. Tests validate Task commands using dry-run mode (`task -n`).

## Setup

```bash
aqua install  # Installs BATS and Task
```

## Running Tests

```bash
bats tests/                              # Run all
bats tests/terraform_plan.bats           # Run specific file
bats --filter-tags precondition tests/   # Run by tag
```

CI runs automatically on PRs and main branch pushes via `.github/workflows/test.yaml`.

## Writing Tests

Tests use Task's dry-run mode to verify command construction:

```bash
@test "terraform:plan validates environment argument" {
  touch "tfvars/test-env.tfvars"  # Setup fixture
  run task -v -n terraform:plan -- test-env
  [ "$status" -eq 0 ]
  [[ "$output" =~ "tofu plan -var-file ./tfvars/test-env.tfvars" ]]
}
```

Key helpers: `setup()`, `teardown()`, `run`, `$status`, `$output`

## Quick Reference

**Debug failed tests:** `echo "Output: $output" >&3`
**Test pattern:** `task -v -n <task> -- <args>`
**Assertions:** `[ ]` for exit codes, `[[ =~ ]]` for regex matching
**Tags:** terraform, plan, basic, args, precondition, config, error
**Fixtures:** Create in `setup()`, clean in `teardown()`

## Troubleshooting

**CI/local mismatch:** Check `teardown()` cleanup and committed test fixtures.

## Resources

- [BATS Documentation](https://bats-core.readthedocs.io/en/stable/)
- [Writing BATS Tests](https://bats-core.readthedocs.io/en/stable/writing-tests.html)
- [Task Documentation](https://taskfile.dev/)
