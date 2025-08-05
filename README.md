[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

# 🍎 Homebrew Tap for Open-WebUI (Native macOS Service)

This tap provides a native macOS Homebrew formula for [Open-WebUI](https://github.com/open-webui/open-webui), a ChatGPT-style web UI that supports both OpenAI APIs and local LLMs via [Ollama](https://ollama.com).

Unlike Docker-based setups, this formula installs Open-WebUI via `pip` in a virtual environment and registers it as a macOS service via `brew services`.

## 🚀 Features

- ✅ No Docker required
- ✅ Runs as a background macOS service (launchd)
- ✅ Auto-starts on login using `brew services`
- ✅ Works with both OpenAI API and local models via Ollama
- ✅ Great for hybrid LLM workflows

## 🔧 Installation

First, tap the repository:

```bash
brew tap andrewdski/openwebui
```

Then install and start Open-WebUI:

```bash
brew install openwebui
brew services start openwebui
```

Once running, access the UI at:

```
http://localhost:3000
```

## 🧪 Testing the Service

You can stop/start manually:

```bash
brew services restart openwebui
```

Check logs if needed:

```bash
tail -f /opt/homebrew/var/log/openwebui.log
```

Or test that it installed correctly:

```bash
open-webui --help
```

## 💡 Notes

- This install uses Python 3.11 via Homebrew and runs Open-WebUI inside a virtualenv.
- The service is registered with `launchd` via Homebrew’s `brew services` mechanism.
- You can customize the port or working directory by editing the formula.

## 📎 Related Projects

- [Open-WebUI](https://github.com/open-webui/open-webui)
- [Ollama](https://ollama.com)
- [Homebrew](https://brew.sh)

## 🛠 TODO

- [ ] Add SQLite or PostgreSQL configuration support
- [ ] Support alternate ports and data directories
- [ ] Optional second formula for Docker-based install

## 🧠 Why?

Because not everything needs Docker — especially on a Mac with good native service management!

