class Usage < Formula
  desc "Tool for working with usage-spec CLIs"
  homepage "https://usage.jdx.dev/"
  url "https://github.com/jdx/usage/archive/refs/tags/v2.1.0.tar.gz"
  sha256 "07f90f346473329e0bf73aa87b2cd95804614ee9a49fed69e9355071977a97b7"
  license "MIT"
  head "https://github.com/jdx/usage.git", branch: "main"

  bottle do
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "c2819d2c0c5ee3807d7058c979c9d7b309c58ffc08b3b0ddb95aaeea7e53743f"
    sha256 cellar: :any_skip_relocation, arm64_sonoma:  "a4ce4fad18bd542b4f93188be6e10bfe9162f138003d75d8b4ff1740c508f848"
    sha256 cellar: :any_skip_relocation, arm64_ventura: "2dbdd1cc18fc090fa3dce6fff9562619a64d93e9cdbbf1b421b5310ca15219d9"
    sha256 cellar: :any_skip_relocation, sonoma:        "22ede804e566016b801d20441e4f494102260762c3b619f4baf83da8cd262fab"
    sha256 cellar: :any_skip_relocation, ventura:       "8d18dcc4ee4e99492f79e3a59a66deeb9e75ec61204b4692127aec6fbfd57a40"
    sha256 cellar: :any_skip_relocation, arm64_linux:   "85f48d28f59fbc349aa2c0317f73f0c7e41fedf27da09ed9b91e7131a294625b"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "ae1316a4ab5068766be7fad75804812341862909b0b5fde0d8edefff1852adca"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args(path: "cli")
  end

  test do
    assert_match "usage-cli", shell_output(bin/"usage --version").chomp
    assert_equal "--foo", shell_output(bin/"usage complete-word --spec 'flag \"--foo\"' -").chomp
  end
end
