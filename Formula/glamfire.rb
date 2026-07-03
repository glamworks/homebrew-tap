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
  version "0.4.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/glamworks/glamfire/releases/download/v#{version}/glam-darwin-arm64"
      sha256 "68b08f29827f6e9defd001f7bc1070bcfad2742e2b533ee40b9d68e56cca8177"
    end
    on_intel do
      url "https://github.com/glamworks/glamfire/releases/download/v#{version}/glam-darwin-x64"
      sha256 "c779ea7e16f484dea969a8b7cdaa9bcbc73047118837ffa918a59e9d9e43d59b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/glamworks/glamfire/releases/download/v#{version}/glam-linux-arm64"
      sha256 "196cf71f92f24f922e051f36d1c3a845e621a8cd7f2fc00153f8db5ce028bc8e"
    end
    on_intel do
      url "https://github.com/glamworks/glamfire/releases/download/v#{version}/glam-linux-x64"
      sha256 "ae05c060a5b7a1decb6e092c70dfda176c057ecdac3493cfa0787e590606962b"
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
