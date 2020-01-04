# XKCD

A Julia package for retrieving the image (and importantly, the hovertext) for the XKCD webcomic:

[xkcd.com](https://xkcd.com)

```julia
using XKCD

XKCD.comic(552)
# Dict{Symbol,String} with 2 entries:
#   :imgsrc => "https://imgs.xkcd.com/comics/correlation.png"
#   :hover  => "Correlation doesn't imply causation, but it does waggle its eyebrows suggestively and gesture furtively while mouthing 'look over there'."
```