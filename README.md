# cdn

OpenFSP brand assets served on `cdn.openfsp.org`, on top of the
[karako-cdn](https://github.com/karakosystems/karako-cdn) image.

The files live in [`openfspht/art`](https://github.com/openfspht/art), pinned
here as a submodule.

## URLs

`/logo/`, `/mark/`, `/wordmark/`, `/avatar/`, `/favicon/`, each holding both the
SVG and the PNG exports.

```
https://cdn.openfsp.org/logo/openfsp-logo.svg
https://cdn.openfsp.org/favicon/favicon-32.png
```

`/discover.json` lists everything.

## Updating

Files are served with a one-year immutable cache, so an asset changes on
purpose or not at all.

```bash
git submodule update --remote art
git commit -am "chore: update art"
```

## Running it

```bash
git clone --recurse-submodules https://github.com/openfspht/cdn.git
docker build -t openfsp-cdn . && docker run -p 8080:8080 openfsp-cdn
```
