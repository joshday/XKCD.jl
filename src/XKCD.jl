module XKCD

using HTTP, JSON3, DefaultApplication

export comic, comicdata, rand_comic

#-----------------------------------------------------------------------------# comicdata
function comicdata(i::Union{Nothing, Integer} = nothing)
    part = isnothing(i) ? "" : "/$i"
    JSON3.read(HTTP.get("https://xkcd.com$part/info.0.json").body)
end

#-----------------------------------------------------------------------------# comic
"""
    comic(i=nothing; open=true)

Get comic number `i` (most recent if `nothing`) and optionally open the image in browser.
"""
function comic(i::Union{Nothing, Int} = nothing; open=false)
    data = comicdata(i)
    open && DefaultApplication.open(download(data.img))
    data
end

#-----------------------------------------------------------------------------# rand_comic
"""
    rand_comic(; open=true)

Retrieve a comic at random.
"""
function rand_comic(; open=true)
    data = comicdata()
    comic(rand(1:data.num); open=open)
end

end # module
