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
  version "0.2.2"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/glamworks/glamfire/releases/download/v#{version}/glam-darwin-arm64"
      sha256 "cdeb4f08da9141e96999c19600969960eb6fce1df4c7a92af790d0b4ef18797d"
    end
    on_intel do
      url "https://github.com/glamworks/glamfire/releases/download/v#{version}/glam-darwin-x64"
      sha256 "589b8c9e0b3b15f27065090f7b58c65e479b81abdbd9fd3439b028cfcf7e73af"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/glamworks/glamfire/releases/download/v#{version}/glam-linux-arm64"
      sha256 "7f15dd97543bb72bd72e7dc7c7deecaf0877c8120c67d700161699f38b5cdc27"
    end
    on_intel do
      url "https://github.com/glamworks/glamfire/releases/download/v#{version}/glam-linux-x64"
      sha256 "2f7b05eea93d9562a3d48a9f9c40ae9d0d3a338d36140a1102e6ccc41049cdfa"
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
