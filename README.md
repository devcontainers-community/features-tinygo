# TinyGo

🤏 Installs tinygo from [tinygo-org/tinygo]

<p align=center>
  <a href="https://www.youtube.com/watch?v=Fl5eFIYU1Xg"><img src="https://i.imgur.com/gqnK3KA.png"></a>
</p>

> TinyGo is a new compiler for an existing programming language, the Go
> programming language. TinyGo focuses on compiling code written in Go, but for
> smaller kinds of systems:
>
> - The Go compiler and tools (from golang.org) are the reference implementation
>   of the Go programming language. They are primarily intended for server side
>   programming but also used for command line tools and other purposes.
> - The TinyGo project implements the exact same programming language. However,
>   TinyGo uses a different compiler and tools to make it suited for embedded
>   systems and WebAssembly. It does this primarily by creating much smaller
>   binaries and targeting a much wider variety of systems.

&mdash; [Overview | TinyGo](https://tinygo.org/getting-started/overview/)

This Dev Container Feature will install TinyGo using the official `.deb` from
the [TinyGo Releases page]. You are then able to use `tinygo` as normal! This
Feature will also auto-install the [TinyGo VS Code extension] and the official
[Golang VS Code extension]. Happy Gophering! 🐿

## Usage

![Codespaces](https://img.shields.io/static/v1?style=for-the-badge&message=Codespaces&color=181717&logo=GitHub&logoColor=FFFFFF&label=)
![Devcontainers](https://img.shields.io/static/v1?style=for-the-badge&message=Devcontainers&color=2496ED&logo=Docker&logoColor=FFFFFF&label=)

To use this feature, all you need to do is add it to your `devcontainer.json`
like this:

```json
// devcontainer.json
"features": {
  "ghcr.io/devcontainers-community/features/tinygo": {}
}
```

❓ Don't know what this ☝ means? Check out [this VS Code blog post].

### Options

If you want to specify a specific version of TinyGo, you can do so like this
with the `version` option:

```jsonc
"features": {
  "ghcr.io/devcontainers-community/features/tinygo": {
    "version": ""
  }
}
```

<!-- prettier-ignore-start -->
[this vs code blog post]: https://code.visualstudio.com/blogs/2022/09/15/dev-container-features
[tinygo-org/tinygo]: https://github.com/tinygo-org/tinygo
[TinyGo Releases page]: https://github.com/tinygo-org/tinygo/releases
[TinyGo VS Code extension]: https://marketplace.visualstudio.com/items?itemName=tinygo.vscode-tinygo
[Golang VS Code extension]: https://marketplace.visualstudio.com/items?itemName=golang.go
<!-- prettier-ignore-end -->
