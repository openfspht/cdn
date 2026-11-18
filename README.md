<p align="center">
  <a href="https://openfsp.org">
    <picture>
      <source media="(prefers-color-scheme: dark)" srcset="https://cdn.openfsp.org/logo/openfsp-logo-inverse.svg">
      <img src="https://cdn.openfsp.org/logo/openfsp-logo.svg" alt="OpenFSP" width="280">
    </picture>
  </a>
</p>

<p align="center"><b>OpenFSP brand assets, served at cdn.openfsp.org</b></p>

Logos, marks, wordmarks, avatars and favicons from [openfspht/art](https://github.com/openfspht/art), in SVG and PNG,
on the [karako-cdn](https://github.com/karakosystems/karako-cdn) image. [`/discover.json`](https://cdn.openfsp.org/discover.json)
lists every file.

```
https://cdn.openfsp.org/logo/openfsp-logo.svg
https://cdn.openfsp.org/mark/openfsp-mark-256.png
```

Files are cached for a year: change an asset on purpose or not at all.

```sh
git submodule update --remote art     # take the latest art
docker build -t openfsp-cdn . && docker run -p 8080:8080 openfsp-cdn
```

The image is published on GHCR (`ghcr.io/openfspht/cdn`) and Docker Hub (`openfsp/cdn`).

## License

[Apache-2.0](LICENSE). The OpenFSP name and marks are not licensed: see [NOTICE](NOTICE).
