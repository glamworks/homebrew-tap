# Homebrew formula for glamfire (the `glam` CLI). Published to the tap repo
# `glamworks/homebrew-tap` by the release workflow, which fills in the version and
# the per-asset SHA-256 placeholders from the tagged release's SHA256SUMS.txt
# (see scripts/render-manifests.mjs). This is a binary formula: it installs the
# prebuilt single-file binary for the host platform — no build-from-source.
#
#   brew install glamworks/tap/glamfire
#
class Glamfire < Formula
  desc "Open, model-agnostic harness for the last mile of AI — the glam CLI"
  homepage "https://glamworks.github.io"
  version "0.7.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/glamworks/glamfire/releases/download/v#{version}/glam-darwin-arm64"
      sha256 "4f8f5fa2fbbe1d415b413a6a7cf930783d704db783de04926a2635975c5be0c7"
    end
    on_intel do
      url "https://github.com/glamworks/glamfire/releases/download/v#{version}/glam-darwin-x64"
      sha256 "d9124fe5d2361fea7a9389f3467834c26b2effd3a1c0c967f09f9a23c62bf68c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/glamworks/glamfire/releases/download/v#{version}/glam-linux-arm64"
      sha256 "55e6257200144a629af8a94f591b5e7dafbbddb9d64de81925e9d97e85c3e262"
    end
    on_intel do
      url "https://github.com/glamworks/glamfire/releases/download/v#{version}/glam-linux-x64"
      sha256 "fec1a342c4f4e5e1b720111bdc320089e501cf9f5bad0cdec5c2afec7fc317d6"
    end
  end

  def install
    # Only one per-platform binary is downloaded; install it as `glam`.
    bin.install Dir["glam-*"].first => "glam"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/glam --version")
  end
end
