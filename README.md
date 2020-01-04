[![Build Status](https://travis-ci.org/joshday/XKCD.jl.svg?branch=master)](https://travis-ci.org/joshday/XKCD.jl)

# XKCD

A Julia package for retrieving the image (and importantly, the hovertext) for the XKCD webcomic:

[xkcd.com](https://xkcd.com)

## Details

This package uses the function `comic(id=nothing; open=true)` to create:

```julia
struct XKCDComic
    id::Int
    title::String
    img::String 
    hover::String
end
```


## Usage

```julia
using XKCD

c = XKCD.comic(552)
# XKCDComic (1, "Correlation", https://imgs.xkcd.com/comics/correlation.png)
#   Correlation doesn't imply causation, but it does waggle its eyebrows suggestively and gesture furtively while mouthing 'look over there'.
```