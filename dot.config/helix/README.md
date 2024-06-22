# Helix Configuration

## Language Server Setup

Language Servers to install to get the config to work as is:

### General editor features

"Simple" Completions, like words, emojis, kanji, etc

```sh
cargo install --git https://github.com/estin/simple-completion-language-server.git
```

### Web development

Vuejs, Typescript, Javascript, HTML, CSS

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
