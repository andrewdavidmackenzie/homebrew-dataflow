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

  # See INSTALLING.md in https://github.com/andrewdavidmackenzie/flow for more details on the need for
  # nightly rust and how to ensure this can be built
  def install
    # Install cargo-binstall
    curl -L --proto '=https' --tlsv1.2 -sSf https://raw.githubusercontent.com/cargo-bins/cargo-binstall/main/install-from-binstall-release.sh | bash
    
    # binstall the flowc binary
    cargo binstall flowc

    # cargo binstall flowr crate's multiple binaries: flowrcli, flowrgui and flowrex

    # download the flowstdlib artifact and expand into $HOME/.flow/lib
    curl -L -s https://github.com/andrewdavidmackenzie/flow/releases/download/v0.135.0/flowstdlib-v0.135.0.tar.xz | tar xvz - -C $HOME/.flow/lib

    # download the flowrcli and flowrgui contexts into $HOME/.flow/runner
    curl -L -s https://github.com/andrewdavidmackenzie/flow/releases/download/v0.135.0/flowrcli-v0.135.0.tar.xz | tar xvz - -C $HOME/.flow/runner
    curl -L -s https://github.com/andrewdavidmackenzie/flow/releases/download/v0.135.0/flowrgui-v0.135.0.tar.xz | tar xvz - -C $HOME/.flow/runner

  end
end
