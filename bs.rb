require "formula"

class Bs < Formula
  homepage "https://github.com/educabilia/bs#readme"
  url "https://github.com/educabilia/bs/archive/v0.2.0.tar.gz"
  sha1 "75bff9691d833e4988240e73088e30f9b8974d1b"

  def install
    bin.install "bin/bs" => "bs"
  end

  test do
    assert !`env`.lines.include?("FOO=bar\n")

    File.open(".env", "w") do |file|
      file.puts("FOO=bar")
    end

    assert `#{bin}/bs env`.lines.include?("FOO=bar\n")
  end
end
