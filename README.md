[![Build Status](https://travis-ci.org/joshday/XKCD.jl.svg?branch=master)](https://travis-ci.org/joshday/XKCD.jl)

# XKCD

A Julia package for retrieving the image (and importantly, the hovertext) for the XKCD webcomic:

[xkcd.com](https://xkcd.com)

```julia
using XKCD

# Creates struct with fields: id, title, img, and hover
c = XKCD.comic(552)
# XKCDComic (1, "Correlation", https://imgs.xkcd.com/comics/correlation.png)
#   Correlation doesn't imply causation, but it does waggle its eyebrows suggestively and gesture furtively while mouthing 'look over there'.
```