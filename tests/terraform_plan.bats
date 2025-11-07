#!/usr/bin/env bats
# Test suite for terraform:plan task command

setup() {
  cd "$(dirname "$BATS_TEST_FILENAME")/.."
  export TEST_WORKSPACE="test-env"
  mkdir -p tfvars backend-configurations
  touch "tfvars/${TEST_WORKSPACE}.tfvars"
  touch "backend-configurations/${TEST_WORKSPACE}.backend.tf"
}

teardown() {
  rm -rf tfvars backend-configurations
}

# bats test_tags=terraform,plan,basic
@test "terraform:plan generates correct command with workspace" {
  run task -v -n tf:plan -- "$TEST_WORKSPACE"

  echo "Output: $output" >&3

  [ "$status" -eq 0 ]
  [[ "$output" =~ terraform.*workspace.*select.*-or-create.*${TEST_WORKSPACE} ]]
  [[ "$output" =~ terraform.*plan.*-var-file.*tfvars/${TEST_WORKSPACE}.tfvars ]]
}

# bats test_tags=terraform,plan,args
@test "terraform:plan passes additional arguments to terraform" {
  run task -v -n tf:plan -- "$TEST_WORKSPACE" -out=tfplan.out -lock=false

  echo "Output: $output" >&3

  [ "$status" -eq 0 ]
  [[ "$output" =~ -out=tfplan.out ]]
  [[ "$output" =~ -lock=false ]]
  [[ "$output" =~ -var-file.*tfvars/${TEST_WORKSPACE}.tfvars ]]
}

# bats test_tags=terraform,plan,precondition
@test "terraform:plan fails when tfvars file does not exist" {
  rm -f "tfvars/${TEST_WORKSPACE}.tfvars"

  run task -v -n tf:plan -- "$TEST_WORKSPACE"

  echo "Output: $output" >&3

  [ "$status" -ne 0 ]
  [[ "$output" =~ "Variables file does not exist" ]]
}

# bats test_tags=terraform,plan,config
@test "terraform:plan uses terraform when USE_TERRAFORM=true" {
  run env USE_TERRAFORM=true task -v -n tf:plan -- "$TEST_WORKSPACE"

  echo "Output: $output" >&3

  [ "$status" -eq 0 ]
  [[ "$output" =~ \[tf:plan\]\ terraform\ workspace\ select ]]
  [[ "$output" =~ \[tf:plan\]\ terraform\ plan ]]
}
