# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
class Flow < Formula
  desc "Dataflow Programming Environment" 
  homepage "https://github.com/andrewdavidmackenzie/flow"
  url "https://github.com/andrewdavidmackenzie/flow/archive/refs/tags/v0.92.0.tar.gz"
  sha256 "e8d5d59deec98ddab995e205ee4b5fe1afc2be04bef1cc06f016676934cd0e12"
  version "0.92.0"
  depends_on "rust" => :build

  def install
    system "cargo", "build", "--release"
    bin.install "target/release/flowc"
    bin.install "target/release/flowr"
    bin.install "target/release/flowrex"
    bin.install "target/release/flowsamples"
    bin.install "target/release/flowstdlib"
  end
end
