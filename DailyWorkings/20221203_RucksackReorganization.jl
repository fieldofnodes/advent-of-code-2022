using Pkg
Pkg.activate(".")

using Chain


rucksack_items = readlines("DailyData/20221203_RucksackReorganization.txt")
alphabet = vcat('a':'z','A':'Z')


function get_point(string,alphabet)
    point = @chain string begin
        intersect(_[1:end÷2],_[end÷2+1:end]) 
        findall(x -> x==_[1] ,alphabet)
        _[1]
    end
    return point
end


# Part 01

sum([get_point(i,alphabet) for i in rucksack_items])
julia> sum([get_point(i,alphabet) for i in rucksack_items])
7878

# Part 02
start = 1:3:300
finish = 3:3:300
function get_point_elf_group(data,start,finish)
    points = @chain data begin
        map((y,z) -> intersect(_[y:z]...),start,finish) 
        [findall(x -> x==i[1] ,alphabet) for i in _]
        sum(_)
    end
    return points    
end


get_point_elf_group(data,start,finish)

julia> get_point_elf_group(data,start,finish)
1-element Vector{Int64}:
 2760

