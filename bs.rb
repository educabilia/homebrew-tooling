require "formula"

class Bs < Formula
  homepage "https://github.com/educabilia/bs#readme"
  url "https://github.com/educabilia/bs/archive/v0.2.1.tar.gz"
  sha1 "4fbc7b28abc6b8da473fd122909a954e99ae1d88"

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
