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
  version "0.2.3"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/glamworks/glamfire/releases/download/v#{version}/glam-darwin-arm64"
      sha256 "4bf13776d039ac771817251ffe7b66fd71c3afb378c3a6cce6209d03749dc6f3"
    end
    on_intel do
      url "https://github.com/glamworks/glamfire/releases/download/v#{version}/glam-darwin-x64"
      sha256 "20288619d92c27164a41b55f675676e6d090438b15337a0b6978b007cfd32928"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/glamworks/glamfire/releases/download/v#{version}/glam-linux-arm64"
      sha256 "b2489b96916489ef03f6b3723cb49a1c0a270bb748c9987ca2d5046ecfbfe6dd"
    end
    on_intel do
      url "https://github.com/glamworks/glamfire/releases/download/v#{version}/glam-linux-x64"
      sha256 "cfa4916c8db337d71c64a3d405ea474bf62ad560e140a7fe012f9115a59793c8"
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
