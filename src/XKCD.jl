module XKCD

using HTTP

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
    myurl = "https://xkcd.com/$(isnothing(i) ? "" : i)"
    body = String(HTTP.get(myurl).body)
    x = split(body, '\n')
    i = findfirst(==("""<div id="comic">"""), x)
    ln = x[i + 1]
    img = "https:$(cleanmatch(match(r"src=\"(.*?)\"", ln).match))"
    hover = cleanmatch(match(r"title=\"(.*?)\"", ln).match)
    title = replace(match(r"<div id=\"ctitle\">(.*?)</div>", body).match, r"(<div id=\"ctitle\">|</div>)" => "")
    if open
        if Sys.isapple()
            run(`open $img`)
        elseif Sys.islinux()
            run(`xdg-open $img`)
        elseif Sys.iswindows()
            run(`start $img`)
        end
    end
    XKCDComic(1, title, img, hover)
end

function cleanmatch(x) 
    x = replace(x, r"(src=|title=|\")" => "")
    x = replace(x, "&quot;" => '"')
    x = replace(x, "&#39;" => "'")
    x = replace(x, "&gt;" => ">")
    x = replace(x, "&lt;" => "<")
end

end # module
