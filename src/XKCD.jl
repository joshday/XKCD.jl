module XKCD

using HTTP

"""
    comic(i=nothing; open=true)

Get comic number `i` (most recent if `nothing`) and optionally open the image in browser.
"""
function comic(i::Union{Nothing, Int} = nothing; open=true)
    myurl = "https://xkcd.com/$(isnothing(i) ? "" : i)"
    x = split(String(HTTP.get(myurl).body), '\n')
    i = findfirst(==("""<div id="comic">"""), x)
    ln = x[i + 1]
    src = "https:$(cleanmatch(match(r"src=\"(.*?)\"", ln).match))"
    title = cleanmatch(match(r"title=\"(.*?)\"", ln).match)
    if open
        if Sys.isapple()
            run(`open $src`)
        elseif Sys.islinux()
            run(`xdg-open $src`)
        elseif Sys.iswindows()
            run(`start $src`)
        end
    end
    Dict(:imgsrc => src, :hover => title)
end

function cleanmatch(x) 
    x = replace(x, r"(src=|title=|\")" => "")
    x = replace(x, "&quot;" => '"')
    x = replace(x, "&#39;" => "'")
end

end # module
