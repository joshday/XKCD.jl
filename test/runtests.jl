using XKCD
using Test

@testset "XKCD.jl" begin
    c = XKCD.Comic(999)
    @test c.json.num == 999
    @test c.json.title == "Cougars"
    @test c.json.img == "https://imgs.xkcd.com/comics/cougars.png"
end
