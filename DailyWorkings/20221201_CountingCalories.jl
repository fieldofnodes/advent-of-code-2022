using Pkg
Pkg.activate(".")
using DelimitedFiles
using Chain

data_path = "DailyData/20221201_CountingCalories.txt"
data = readdlm(data_path)




f = open(data_path)
lines = readlines(f)
#empty_lines = [l == "" ? "Empty" : l for l in lines]
empty_indx = findall(==(""),lines)
lower_bounds = vcat(0,empty_indx)
sum_cals_per_elf = 
    [sum(parse.(Int,lines[lower_bounds[i]+1:lower_bounds[i+1]-1])) 
        for i in 1:eachindex(lower_bounds).stop-1]

top_cals = maximum(sum_cals_per_elf)
top_3_cals = sort(sum_cals_per_elf,rev=true)[1:3] |> sum


