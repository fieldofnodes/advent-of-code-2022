using Pkg
Pkg.activate(".")
using DelimitedFiles
using Chain

data_path = "DailyData/20221201_CountingCalories.txt"
data = readdlm(data_path)




f = open(data_path)
lines = readlines(f)
[l == "" ? "Empty" : l for l in lines]

