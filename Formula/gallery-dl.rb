class GalleryDl < Formula
  include Language::Python::Virtualenv

  desc "Command-line downloader for image-hosting site galleries and collections"
  homepage "https://github.com/mikf/gallery-dl"
  url "https://files.pythonhosted.org/packages/96/34/7c139693cb347376d272da4ca86a614743bc507cfbfe56512b7328bd858b/gallery_dl-1.20.5.tar.gz"
  sha256 "509028c51c9b118c5063eee5feccd28fd7f2d49e79db26b117731d6849838904"
  license "GPL-2.0-only"
  head "https://github.com/mikf/gallery-dl.git", branch: "master"

  bottle do
    sha256 cellar: :any_skip_relocation, arm64_monterey: "7575db687ede5bafbf2f70b74472cb73ee9e0483968ef2a66bc168dcb8b39813"
    sha256 cellar: :any_skip_relocation, arm64_big_sur:  "7575db687ede5bafbf2f70b74472cb73ee9e0483968ef2a66bc168dcb8b39813"
    sha256 cellar: :any_skip_relocation, monterey:       "ef8e05d023a475cfa05d2ae8a6d0eb81b50625cd5652e6a549b3d6e8b748811f"
    sha256 cellar: :any_skip_relocation, big_sur:        "ef8e05d023a475cfa05d2ae8a6d0eb81b50625cd5652e6a549b3d6e8b748811f"
    sha256 cellar: :any_skip_relocation, catalina:       "ef8e05d023a475cfa05d2ae8a6d0eb81b50625cd5652e6a549b3d6e8b748811f"
    sha256 cellar: :any_skip_relocation, x86_64_linux:   "8b17e4328eb2a16bc43cb724449e47e18375703ec3f0237c8388586e3cd847f5"
  end

  depends_on "python@3.10"

  resource "certifi" do
    url "https://files.pythonhosted.org/packages/6c/ae/d26450834f0acc9e3d1f74508da6df1551ceab6c2ce0766a593362d6d57f/certifi-2021.10.8.tar.gz"
    sha256 "78884e7c1d4b00ce3cea67b44566851c4343c120abd683433ce934a68ea58872"
  end

  resource "charset-normalizer" do
    url "https://files.pythonhosted.org/packages/56/31/7bcaf657fafb3c6db8c787a865434290b726653c912085fbd371e9b92e1c/charset-normalizer-2.0.12.tar.gz"
    sha256 "2857e29ff0d34db842cd7ca3230549d1a697f96ee6d3fb071cfa6c7393832597"
  end

  resource "idna" do
    url "https://files.pythonhosted.org/packages/62/08/e3fc7c8161090f742f504f40b1bccbfc544d4a4e09eb774bf40aafce5436/idna-3.3.tar.gz"
    sha256 "9d643ff0a55b762d5cdb124b8eaa99c66322e2157b69160bc32796e824360e6d"
  end

  resource "requests" do
    url "https://files.pythonhosted.org/packages/60/f3/26ff3767f099b73e0efa138a9998da67890793bfa475d8278f84a30fec77/requests-2.27.1.tar.gz"
    sha256 "68d7c56fd5a8999887728ef304a6d12edc7be74f1cfa47714fc8b414525c9a61"
  end

  resource "urllib3" do
    url "https://files.pythonhosted.org/packages/b0/b1/7bbf5181f8e3258efae31702f5eab87d8a74a72a0aa78bc8c08c1466e243/urllib3-1.26.8.tar.gz"
    sha256 "0e7c33d9a63e7ddfcb86780aac87befc2fbddf46c58dbb487e0855f7ceec283c"
  end

  def install
    virtualenv_install_with_resources
  end

  test do
    system bin/"gallery-dl", "https://imgur.com/a/dyvohpF"
    expected_sum = "126fa3d13c112c9c49d563b00836149bed94117edb54101a1a4d9c60ad0244be"
    file_sum = Digest::SHA256.hexdigest File.read(testpath/"gallery-dl/imgur/dyvohpF/imgur_dyvohpF_001_ZTZ6Xy1.png")
    assert_equal expected_sum, file_sum
  end
end
