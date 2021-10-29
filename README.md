 [![Build status](https://github.com/joshday/XKCD.jl/workflows/CI/badge.svg)](https://github.com/joshday/XKCD.jl/actions?query=workflow%3ACI+branch%3Amaster) 

# XKCD

A Julia package for retrieving data from the XKCD webcomic: [xkcd.com](https://xkcd.com).

## Usage

Use the `Comic` struct to retrieve a comic's metadata.
The `comic` function retrieves the comic's data and optionally opens the image in a browser.

```julia
using XKCD

julia> Comic(552)
```

```
Comic
{
        "month": "3",
          "num": 552,
         "link": "",
         "year": "2009",
         "news": "",
   "safe_title": "Correlation",
   "transcript": "[[A man is talking to a woman]]\nMan: I used to think correlation implied causation.\nMan: Then I took a statistics class.  Now I don't.\nWoman: Sounds like the class helped.\nMan: Well, maybe.\n{{Title text: Correlation doesn't imply causation, but it does waggle its eyebrows suggestively and gesture furtively while mouthing 'look over there'.}}",
          "alt": "Correlation doesn't imply causation, but it does waggle its eyebrows suggestively and gesture furtively while mouthing 'look over there'.",
          "img": "https://imgs.xkcd.com/comics/correlation.png",
        "title": "Correlation",
          "day": "6"
}
```

## Special Features:

### Display in Pluto/Jupyter

![](https://user-images.githubusercontent.com/8075494/106803558-57100e00-6632-11eb-8fdb-c2050d91ef2a.png)

### Retrieve a comic at random

```julia
rand(Comic)
```
