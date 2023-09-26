# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
class Dataflow < Formula
  desc "The 'flow' dataflow programming environment" 
  homepage "https://github.com/andrewdavidmackenzie/flow"
  url "https://github.com/andrewdavidmackenzie/flow/archive/refs/tags/v0.135.0.tar.gz"
  sha256 "05a7e7e92d5000ed48416bae212329d837038cc61136fa4661d1ac81f30e10dc"
  version "0.135.0"
  
  depends_on "rust" => :build # Newlines surrounding `depends_on` is required.

  def install
    # Install cargo-binstall
    system "curl", "-L", "--tlsv1.2", "-sSf", "https://raw.githubusercontent.com/cargo-bins/cargo-binstall/main/install-from-binstall-release.sh", "-o", "install-from-binstall-release.sh"
    system "bash", "install-from-binstall-release.sh"
    
    # binstall the flowc binary
    system "cargo",  "binstall", "flowc"

    # cargo binstall flowr crate's multiple binaries: flowrcli, flowrgui and flowrex

    # download the flowstdlib artifact and expand into $HOME/.flow/lib
    system "curl", "-L", "--tlsv1.2", "-sSf", "https://github.com/andrewdavidmackenzie/flow/releases/download/v0.135.0/flowstdlib-v0.135.0.tar.xz", "-o", "flowstdlib-v0.135.0.tar.xz"
    system "tar", "-xvz", "-f", "flowstdlib-v0.135.0.tar.xz", "-C" "$HOME/.flow/lib"

    # download the flowrcli context into $HOME/.flow/runner
    system "curl", "-L", "--tlsv1.2", "-sSf", "https://github.com/andrewdavidmackenzie/flow/releases/download/v0.135.0/flowrcli-v0.135.0.tar.xz", "-o", "flowrcli-v0.135.0.tar.xz"
    system "tar", "-xvz", "-f", "flowrcli-v0.135.0.tar.xz", "-C" "$HOME/.flow/lib"

    # download the flowrgui context into $HOME/.flow/runner
    system "curl", "-L", "--tlsv1.2", "-sSf", "https://github.com/andrewdavidmackenzie/flow/releases/download/v0.135.0/flowrgui-v0.135.0.tar.xz", "-o", "flowrgui-v0.135.0.tar.xz"
    system "tar", "-xvz", "-f", "flowrgui-v0.135.0.tar.xz", "-C" "$HOME/.flow/lib"

  end
end
