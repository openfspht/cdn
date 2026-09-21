# cdn

OpenFSP brand assets served on `cdn.openfsp.org`, packaged on top of the
[karako-cdn](https://github.com/karakosystems/karako-cdn) image.

This repository holds no files of its own. The assets live in
[`openfspht/art`](https://github.com/openfspht/art), pinned here as a submodule,
so there is one source of truth and no copy to keep in step.

## URLs

`art` stores its sources by format, `logo/` for SVG and `png/` for the exports.
The CDN serves them by asset instead, so a URL names what a file is rather than
how it was produced.

| Path | Holds |
|---|---|
| `/logo/` | the full logo, SVG and PNG |
| `/mark/` | the symbol alone |
| `/wordmark/` | the name alone |
| `/avatar/` | profile images |
| `/favicon/` | favicons and `apple-touch-icon.png` |

```
https://cdn.openfsp.org/logo/openfsp-logo.svg
https://cdn.openfsp.org/logo/openfsp-logo-512.png
https://cdn.openfsp.org/favicon/favicon-32.png
```

`/discover.json` lists every file with its size and etag.

## Updating the assets

A submodule points at a commit, not at a branch, so a change in `art` does not
reach the CDN on its own. That is deliberate: files are served with a one-year
immutable cache, so they should only ever change on purpose.

```bash
git submodule update --remote art
git commit -am "chore: update art to <short-sha>"
```

Files are cached for a year, so change the URL rather than the file when a
published asset has to change.

## Running it

```bash
git clone --recurse-submodules https://github.com/openfspht/cdn.git
docker build -t openfsp-cdn .
docker run -p 8080:8080 openfsp-cdn
curl -s localhost:8080/discover.json
```

The base image version is pinned in the `Dockerfile` and bumped by Dependabot.

## Licence

The assets are Apache-2.0, as recorded in `art`. They may be used to refer to
OpenFSP, not to suggest its endorsement.
