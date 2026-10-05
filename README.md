# FortiMune Injection — iOS Shell

This repository is the iOS application shell for FortiMune Injection Management.

## Architecture

- Master application / business logic: `https://ebrahimemary3-beep.github.io/FortiMune-Injection-Management/`
- Backend: Supabase used by the Master web application.
- iOS role: WKWebView shell + iOS-specific permissions and system integration.
- Business logic is intentionally NOT duplicated here.

## Repository

Create a repository named:

`FortiMune-Injection-iOS`

Upload the contents of this folder to the repository root (do not upload the outer folder itself).

## GitHub Actions

`.github/workflows/build-ios.yml` builds an **unsigned iOS Simulator app** on GitHub's macOS runner. This is for CI validation only.

For a real iPhone IPA / TestFlight / App Store build, Apple signing credentials and an Apple Developer account are required. Those signing secrets should be added later; never commit certificates, provisioning profiles, or private keys to this repository.

## Important

Do not modify request/assignment/close/settlement business logic in this repository. Those features belong to the Master web application so one change is reflected on Android and iOS.
