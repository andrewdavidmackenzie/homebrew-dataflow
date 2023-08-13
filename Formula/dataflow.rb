# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
class Dataflow < Formula
  desc "The 'flow' dataflow programming environment" 
  homepage "https://github.com/andrewdavidmackenzie/flow"
  url "https://github.com/andrewdavidmackenzie/flow/archive/refs/tags/v0.130.0.tar.gz"
  sha256 "e8d5d59deec98ddab995e205ee4b5fe1afc2be04bef1cc06f016676934cd0e12"
  version "0.130.0"
  depends_on "rust" => :build

  def install
    system "cargo", "+nightly", "build", "--release"
    bin.install "target/release/flowc"
    bin.install "target/release/flowr"
    bin.install "target/release/flowrex"
    bin.install "target/release/flowstdlib"
    system "flowc", "-d", "-g", "-O", "flowstdlib"
  end
end
