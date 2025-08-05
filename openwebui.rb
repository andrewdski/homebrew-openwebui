class Openwebui < Formula
  include Language::Python::Virtualenv

  desc "ChatGPT-style UI supporting OpenAI API and local LLMs via Ollama"
  homepage "https://github.com/open-webui/open-webui"
  url "https://files.pythonhosted.org/packages/57/1f/661199a34c721a44c877e7a579bf94e7cc0afc348c37c1bcb1f3e0256ef6/open_webui-0.6.18.tar.gz"
  sha256 "18b1a5aed8076b8fa3570594f0de26720cb406c9f4f4874236ac5274f48752a9"

  license "AGPL-3.0"

  depends_on "python@3.11"

  def install
    # We need node to install the frontend dependencies
    # and it must be in the PATH for the virtualenv to find it.
    ENV["PATH"] = "#{Formula["node"].opt_bin}:#{ENV["PATH"]}"

    # Create virtual environment
    venv = virtualenv_create(libexec, "python3.11")

    # Install missing build tools manually (required for pyproject.toml support)
    venv.pip_install "poetry-core"
    venv.pip_install "wheel"

    # Install the package into the virtualenv and link entry points
    venv.pip_install_and_link buildpath

    # Old method for installing resources
    #virtualenv_install_with_resources
  end

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
