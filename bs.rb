require "formula"

class Bs < Formula
  homepage "https://github.com/educabilia/bs#readme"
  url "https://github.com/educabilia/bs/archive/v0.2.1.tar.gz"
  sha256 "0056ecd96a8f9135ac57bd82e5b9e328f517dcb699d916237880ff72c1aff935"

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
