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
  version "0.3.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/glamworks/glamfire/releases/download/v#{version}/glam-darwin-arm64"
      sha256 "67c5b3a6514cde25f0857828763584a42b2316eba75f0ccea3b9121ec30add71"
    end
    on_intel do
      url "https://github.com/glamworks/glamfire/releases/download/v#{version}/glam-darwin-x64"
      sha256 "9ee762fdde5b501b0403adbcf3000cd3b332e317afa4635afca41af067488b38"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/glamworks/glamfire/releases/download/v#{version}/glam-linux-arm64"
      sha256 "31787236830404ec76436c7b47506dfa4a0d1367d2112a7db6ff0b1fda82f4ee"
    end
    on_intel do
      url "https://github.com/glamworks/glamfire/releases/download/v#{version}/glam-linux-x64"
      sha256 "7edadb826af77d4566638b63a588db7f44f7b006248a9020e1226f2f1ed1accd"
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
