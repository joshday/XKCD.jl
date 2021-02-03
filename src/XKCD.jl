module XKCD

using HTTP, JSON3, DefaultApplication

export Comic

#-----------------------------------------------------------------------------# Comic
"""
    Comic()         # Most recent comic
    Comic(i::Int)   # i-th issue

Get the data for comic `i` (or the most recent
"""
struct Comic 
    json::JSON3.Object
end

Comic() = Comic(JSON3.read(HTTP.get("https://xkcd.com/info.0.json").body))
Comic(i::Int) = Comic(JSON3.read(HTTP.get("https://xkcd.com/$i/info.0.json").body))

#-----------------------------------------------------------------------------# show
function Base.show(io::IO, o::Comic)
    println(io, "Comic")
    show(io, o.json)
end

function Base.show(io::IO, ::MIME"text/html", c::Comic)
    show(io, MIME"text/html"(), HTML("""
	   <div>
        <h2><code>XKCD.Comic</code> $(c.json.num): $(c.json.title)</h2>
        <img src="$(c.json.img)" alt="$(c.json.alt)">
		<div>
          <a href="https://xkcd.com/$(c.json.num)">
            Link to Original
          </a>
	    </div>
      </div>
    """))
end

#-----------------------------------------------------------------------------# rand
Base.rand(::Type{Comic}) = Comic(rand(1:Comic().json.num))

end # module
