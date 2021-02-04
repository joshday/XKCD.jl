### A Pluto.jl notebook ###
# v0.12.20

using Markdown
using InteractiveUtils

# This Pluto notebook uses @bind for interactivity. When running this notebook outside of Pluto, the following 'mock version' of @bind gives bound variables a default value (instead of an error).
macro bind(def, element)
    quote
        local el = $(esc(element))
        global $(esc(def)) = Core.applicable(Base.get, el) ? Base.get(el) : missing
        el
    end
end

# ╔═╡ 2a600f08-6660-11eb-3d8a-cdb566c812d5
using XKCD, PlutoUI

# ╔═╡ 38f28954-6660-11eb-298e-cd02923b4fb0
current = Comic();

# ╔═╡ 422e9fe6-6660-11eb-0687-f9fbb67772f5
@bind sel NumberField(1:current.json.num, default=current.json.num)

# ╔═╡ 5579fffa-6660-11eb-2104-a5583bf197b2
Comic(sel)

# ╔═╡ Cell order:
# ╠═2a600f08-6660-11eb-3d8a-cdb566c812d5
# ╠═38f28954-6660-11eb-298e-cd02923b4fb0
# ╠═422e9fe6-6660-11eb-0687-f9fbb67772f5
# ╠═5579fffa-6660-11eb-2104-a5583bf197b2
