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
    system "cargo", "install", "--path", "flowc"
    system "cargo", "install", "--path", "flowr" # with it's multiple flowrcli and flowrgui binaries
    system "flowc", "-d", "-g", "-O", "flowstdlib"
    system "flowc", "flowr/src/bin/flowrcli"
    system "flowc", "flowr/src/bin/flowrgui"
  end
end
