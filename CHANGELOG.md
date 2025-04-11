# Changelog

## [0.2.0](https://github.com/masterpointio/taskit/compare/v0.1.0...v0.2.0) (2025-04-11)


### Features

* **snaplet:** use `SNAPLET_TARGET_DB_NAME` to specify specific databases ([#13](https://github.com/masterpointio/taskit/issues/13)) ([739b318](https://github.com/masterpointio/taskit/commit/739b3185d69d36eac8b8b62f13617651a5d121b8))

## 0.1.0 (2024-12-23)


### Features

* adds a complete set of toolbox tasks ([0611c3d](https://github.com/masterpointio/taskit/commit/0611c3d834d72df37fec991741244a7a57096e3d))
* adds a restore:noprompt task ([4835245](https://github.com/masterpointio/taskit/commit/4835245fb1ad230fc3b27529b3e778b4f43a803c))
* adds tasks to manage MP components ([8a1bcbc](https://github.com/masterpointio/taskit/commit/8a1bcbc3f3b796f2e25831c6f4b73dad46d83e60))
* adds the initial README, trunk, GHA, and general repo setup ([720db35](https://github.com/masterpointio/taskit/commit/720db35ddc5db309ea32d982de23d9066f8b88b5))
* moves Terraform + mixin tasks to where they belong ([b7f86e8](https://github.com/masterpointio/taskit/commit/b7f86e89abea5c860cb1aa358840e73123222280))
* switch from yq to dasel ([f4513f0](https://github.com/masterpointio/taskit/commit/f4513f02f34dd60f91b6e17cd094a3dedc587088))
* updates snaplet to ensure COPYCAT_SECRET ([42e534e](https://github.com/masterpointio/taskit/commit/42e534e9f6592723f38b1d4911e0c65d78785447))
* upsteams taskfiles from client, adds info on usage, adds exports/ ([9b27045](https://github.com/masterpointio/taskit/commit/9b270457b1b1b7d2fed98f713178384e1458ec48))


### Bug Fixes

* adds SNAPSHOT_ENV in snaplet bucket upload / download path ([c6f08bf](https://github.com/masterpointio/taskit/commit/c6f08bf28f4f54d01aff0c3aae46d1899c65a916))
* always need ending slash on TASKIT_LOCAL_PATH ([9e961f0](https://github.com/masterpointio/taskit/commit/9e961f0e992423b851d54648de63f76980e8b931))
* clean needs to be passed the snapshot path ([8d9d719](https://github.com/masterpointio/taskit/commit/8d9d719a7134f20568cd7c48b01de64d53c80ca7))
* flag for local vs remote init was wrong ([dfc3fa8](https://github.com/masterpointio/taskit/commit/dfc3fa862af180fda2b1077d73d93416062e95ad))
* renames snaplet vars to avoid collisions ([8d9d719](https://github.com/masterpointio/taskit/commit/8d9d719a7134f20568cd7c48b01de64d53c80ca7))
* updates https &gt; ssh to allow clone in CI ([4cb2653](https://github.com/masterpointio/taskit/commit/4cb2653d051ddbde1302c85ca8d148a6bcaba9d6))
* updates to not create snapshot path after rm -rf ([e32a0e7](https://github.com/masterpointio/taskit/commit/e32a0e79243d4c48782ab313676f711d9cd779fe))
