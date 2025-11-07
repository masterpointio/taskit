# Taskit Test Suite

## Purpose

This directory contains the BATS (Bash Automated Testing System) test suite for Taskit. Tests validate Task command functionality using dry-run mode, ensuring reliability without requiring actual tool installations.

## Prerequisites

Install BATS:

```bash
# macOS
brew install bats-core

# Debian/Ubuntu
apt-get install bats

# Manual installation
git clone https://github.com/bats-core/bats-core.git
cd bats-core
./install.sh /usr/local
```

## Running Tests

### Local Development

```bash
# Run all tests
bats tests/

# Run specific test file
bats tests/terraform_plan.bats

# Run tests by tag
bats --filter-tags basic tests/
bats --filter-tags precondition tests/
```

### Continuous Integration

Tests run automatically on:

- **Pull Requests**: All PRs trigger the test suite
- **Main Branch**: Tests run on every push to main

The GitHub Actions workflow (`.github/workflows/test.yaml`) handles:

1. BATS and Task installation
2. Test execution across the `tests/` directory
3. Result artifacts upload (30-day retention)

View results in the GitHub Actions tab or PR checks section.

## Writing Tests

Tests leverage Task's dry-run mode (`task -v -n`) to verify command construction without execution:

```bash
@test "terraform:plan validates environment argument" {
  # Arrange: Create test fixture
  touch "tfvars/test-env.tfvars"

  # Act: Execute task in dry-run mode
  run task -v -n terraform:plan -- test-env

  # Assert: Verify output
  [ "$status" -eq 0 ]
  [[ "$output" =~ "expected text" ]]
}
```

### Test Structure

- `setup()`: Pre-test fixture creation and environment setup
- `@test "description"`: Individual test case
- `teardown()`: Post-test cleanup

### Test Tags

Use tags for selective test execution:

- `terraform`: Terraform-related functionality
- `plan`: Plan command behavior
- `basic`: Core functionality
- `args`: Argument handling
- `precondition`: Validation logic
- `config`: Configuration management
- `error`: Error handling

## Best Practices

1. **Dry-run Testing**: Use `task -v -n` to test without requiring actual tool installations
2. **Debug Output**: Include `echo "Output: $output" >&3` for troubleshooting failed tests
3. **Fixture Management**: Create temporary files in `setup()`, clean up in `teardown()`
4. **Assertions**: Use `[ ]` for exit codes, `[[ =~ ]]` for pattern matching

## Troubleshooting

**Tests fail in CI but pass locally:**

- Ensure proper cleanup in `teardown()`
- Verify tests don't depend on local environment state
- Confirm all required files are committed

**Workflow doesn't run:**

- Verify `.github/workflows/test.yaml` exists
- Check GitHub Actions are enabled for the repository
- Review branch protection rules

## Workflow Permissions

The CI workflow uses minimal permissions:

- `actions: read` - Access workflow logs
- `checks: write` - Report check results
- `contents: read` - Read repository
- `pull-requests: read` - Access PR information

No secrets or credentials required for test execution.

## Resources

- [BATS Documentation](https://bats-core.readthedocs.io/en/stable/)
- [Writing BATS Tests](https://bats-core.readthedocs.io/en/stable/writing-tests.html)
- [Task Documentation](https://taskfile.dev/)
