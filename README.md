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

XKCD.comicdata(552)
# JSON3.Object{Base.CodeUnits{UInt8,JSON3.VectorString{Array{UInt8,1}}},Array{UInt64,1}} with 11 entries:
#   :month      => "3"
#   :num        => 552
#   :link       => ""
#   :year       => "2009"
#   :news       => ""
#   :safe_title => "Correlation"
#   :transcript => "[[A man is talking to a woman]]\nMan: I used to think correlation implied causation.\nMan: Then I took a statistics class.  Now I don't…
#   :alt        => "Correlation doesn't imply causation, but it does waggle its eyebrows suggestively and gesture furtively while mouthing 'look over there…
#   :img        => "https://imgs.xkcd.com/comics/correlation.png"
#   :title      => "Correlation"
#   :day        => "6"

c = XKCD.comic(552)
# XKCDComic (1, "Correlation", https://imgs.xkcd.com/comics/correlation.png)
#   Correlation doesn't imply causation, but it does waggle its eyebrows suggestively and gesture furtively while mouthing 'look over there'.
```