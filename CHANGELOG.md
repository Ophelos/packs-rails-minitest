# Changelog

## 0.2.0

### Features

- Make prepare tasks depend on the prepare tasks of the dependencies

## 0.1.5

### Fixes

- Bumped version number due to bad gem push

## 0.1.4

### Features

- Support the `TESTOPTS` environment variable

## 0.1.3

### Bug fixes

- Exit code is now non-zero when tests fail (specifically it matches whatever exit codes `rails test` uses)

## 0.1.2

### Features

- Support the `TEST` environment variable in the overridden `rake test`

## 0.1.1

### Features

- Added ability to override `test`, `test:system` and `test:all` tasks

## 0.1.0

### Features

- Added basic `packs:test` Rake tasks
