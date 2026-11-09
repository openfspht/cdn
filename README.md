# cdn

I serve the OpenFSP brand assets on `cdn.openfsp.org`, on top of the
[karako-cdn](https://github.com/karakosystems/karako-cdn) image. The files come from
[`openfspht/art`](https://github.com/openfspht/art), pinned as a submodule.

Paths: `/logo/`, `/mark/`, `/wordmark/`, `/avatar/`, `/favicon/`, each with SVG and PNG;
`/discover.json` lists everything.

```
https://cdn.openfsp.org/logo/openfsp-logo.svg
https://cdn.openfsp.org/favicon/favicon-32.png
```

## Update

Files carry a one-year immutable cache, so an asset changes on purpose or not at all.

```bash
git submodule update --remote art
git commit -am "chore: update art"
```

## Run locally

```bash
git clone --recurse-submodules https://github.com/openfspht/cdn.git
docker build -t openfsp-cdn . && docker run -p 8080:8080 openfsp-cdn
```
