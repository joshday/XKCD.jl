module XKCD

using HTTP, JSON3

function comicdata(i::Union{Nothing, Integer} = nothing)
    part = isnothing(i) ? "" : "/$i"
    JSON3.read(HTTP.get("https://xkcd.com$part/info.0.json").body)
end

#-----------------------------------------------------------------------------# XKCDComic
struct XKCDComic
    id::Int
    title::String
    img::String 
    hover::String
end

Base.Dict(x::XKCDComic) = Dict(:id=>x.id, :title=>x.title, :img=>x.img, :hover=>x.hover)

function Base.show(io::IO, x::XKCDComic)
    println(io, "XKCDComic ($(x.id), \"$(x.title)\", $(x.img))")
    printstyled(io, "  " * x.hover, color=:light_black)
end

#-----------------------------------------------------------------------------# comic
"""
    comic(i=nothing; open=true)

Get comic number `i` (most recent if `nothing`) and optionally open the image in browser.  Returns
an `XKCDComic` struct with fields `id`, `title`, `img`, and `hover`.
"""
function comic(i::Union{Nothing, Int} = nothing; open=true)
    data = comicdata(i)
    img, hover, title, id = data.img, data.alt, data.safe_title, data.num
    open && Sys.isapple() && run(`open $img`)
    open && Sys.islinux() && run(`xdg-open $img`)
    open && Sys.iswindows() &&run(`start $img`)
    XKCDComic(id, title, img, hover)
end

end # module
