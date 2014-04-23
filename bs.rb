require "formula"

class Bs < Formula
  homepage "https://github.com/educabilia/bs#readme"
  url "https://github.com/educabilia/bs/archive/v0.1.0.tar.gz"
  sha1 "1d92ecca99c6619bdb9a483be2cc45f095c62988"

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
