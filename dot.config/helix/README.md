# Helix Configuration

## Language Server Setup

Language Servers to install to get the config to work as is:

### General editor features

"Simple" Completions, like words, emojis, kanji, etc

```sh
cargo install --git https://github.com/estin/simple-completion-language-server.git
# after setting up the helix config, run:
simple-completion-language-server fetch-external-snippets
# and optionally validate the snippets with
simple-completion-language-server validate-snippets
simple-completion-language-server validate-unicode-input
```

This LS uses snippets and mappings for completions. My config uses the suggested [friendly-snippets](https://github.com/rafamadriz/friendly-snippets/) and [vim-unicode-snippets](https://github.com/danielwe/vim-unicode-snippets/blob/master/snippets/_.snippets).

"Smart" Completions, aka LLM support

This config uses [helix-gpt](https://github.com/leona/helix-gpt/) to integrate Codeium smart completions. Please also check out [LSP-AI](https://github.com/SilasMarvin/lsp-ai/) as an alternative, that supports local inference with models like [stable-code-3b](https://huggingface.co/stabilityai/stable-code-3b) via llama.cpp.
In case you need to fetch the Codeium API key (which is weirdly not possible directly via their web interface), log into their web interface and open [the vim plugin api key page](https://www.codeium.com/profile?response_type=token&redirect_uri=vim-show-auth-token&state=a&scope=openid%20profile%20email&redirect_parameters_type=query). Then copy and paste the API key either into the config or set it up as environment variable `CODEIUM_API_KEY` (I have a ~/.env file for such keys, that I source in .profile to avoid publishing them in my repository).

To install helix-gpt, please refer to [the readme](https://github.com/leona/helix-gpt/tree/master?tab=readme-ov-file#install). I use it "without bun", by downloading a release version and throwing the binary into my local bin folder:

```sh
# version 0.31 was newest at the time of writing
wget https://github.com/leona/helix-gpt/releases/download/0.31/helix-gpt-0.31-x86_64-linux.tar.gz \
-O /tmp/helix-gpt.tar.gz \
&& tar -zxvf /tmp/helix-gpt.tar.gz \
&& mv helix-gpt-0.31-x86_64-linux ~/.local/bin/helix-gpt \
&& chmod +x ~/.local/bin/helix-gpt
```

### Web development

Vuejs, Typescript, Javascript, HTML, CSS

Inspired by https://dev.to/morlinbrot/configure-helix-for-typescript-eslint-prettierdprint-582c

```sh
# vscode-langservers-extracted includes LSs for html, css, json, markdown and eslint
# typescript runtime should be installed globally to make the typescript and vue language servers work
npm i -g typescript typescript-language-server vscode-langservers-extracted emmet-ls @vue/language-server
```

### JSON, YAML, TOML

```sh
npm i -g vscode-json-language-server # part of vscode-langservers-extracted
npm i -g yaml-language-server
# TOML: see https://taplo.tamasfe.dev/cli/installation/binary.html for taplo binarys
cargo install taplo-cli --locked # or cargo install taplo-cli --locked --no-default-features --features lsp
```

### Rust

To learn more about the Rust language, check out [rust-lang.org](https://www.rust-lang.org/). The language server for Rust I use is [rust-analyzer](https://rust-analyzer.github.io/). There was [RLS](https://github.com/rust-lang/rls) before, but it got [deprecated](https://blog.rust-lang.org/2022/07/01/RLS-deprecation.html) in favour of rust-analyzer. Check out [installation info for the binary](https://rust-analyzer.github.io/manual.html#rust-analyzer-language-server-binary) or install via [Rustup](https://rustup.rs/):

```sh
rustup component add rust-analyzer
```

### Zig

To learn more about the Zig language, check out [ziglang.org](https://ziglang.org/). The language server for Zig is called [ZLS](https://github.com/zigtools/zls).
Make sure to always keep the version of Zig and ZLS in sync. The version at the time of writing was 0.13.0.

```sh
# or check out binary release on github.com/zigtools/zls
git clone https://github.com/zigtools/zls
cd zls
zig build -Doptimize=ReleaseSafe
```

### V

V is another rather young programming language, that aims to be simple, fast and safe. Check out [vlang.io](https://vlang.io/) for more.
[VLS](https://vpm.vlang.io/packages/vls) is the language server for V.

```sh
# Since V 0.3.1 the language server can simply be installed via
v ls --install
```
