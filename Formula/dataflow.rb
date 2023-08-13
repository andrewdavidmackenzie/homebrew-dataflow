# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
class Dataflow < Formula
  desc "The 'flow' dataflow programming environment" 
  homepage "https://github.com/andrewdavidmackenzie/flow"
  url "https://github.com/andrewdavidmackenzie/flow/archive/refs/tags/v0.130.0.tar.gz"
  sha256 "6e745180a9015d576fb774dfb04c776958cf040809592a6b3e165836fb041d99"
  version "0.130.0"
  
  depends_on "rust" => :build # Newlines surrounding `depends_on` is required.

  def install
    system "cargo", "install", "--path", "flowc"
    system "flowc", "-d", "-g", "-O", "flowstdlib"
  end
end
