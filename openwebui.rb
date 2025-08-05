class Openwebui < Formula
  include Language::Python::Virtualenv

  desc "ChatGPT-style UI supporting OpenAI API and local LLMs via Ollama"
  homepage "https://github.com/open-webui/open-webui"
  url "https://files.pythonhosted.org/packages/source/o/open-webui/open-webui-0.1.119.tar.gz"
  sha256 "4cb74a403c127af64d51d62c45f85044c5a3520b18b138c5b1dfd20db123f62b"
  license "AGPL-3.0"

  depends_on "python@3.11"

  def install
    virtualenv_install_with_resources
  end

  plist_options manual: "open-webui serve"

  service do
    run [opt_bin/"open-webui", "serve", "--host", "127.0.0.1", "--port", "3000"]
    keep_alive true
    working_dir var
    log_path var/"log/openwebui.log"
    error_log_path var/"log/openwebui.error.log"
  end

  test do
    system "#{bin}/open-webui", "--help"
  end
end
