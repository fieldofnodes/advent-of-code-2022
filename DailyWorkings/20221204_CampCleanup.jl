using Pkg
Pkg.activate(".")
using Chain

data = readlines("DailyData/20221204_CampCleanup.txt")


function convert_input_to_vector(line)
    vec_values = @chain line begin
        split(_,r"[-,]")
        [parse(Int64,i) for i in _]
    end
    
    return vec_values
end

function is_fully_contained(sections)
    a,b,c,d = sections
    
    if a <= c && b >= d || a >= c && b <= d
        contained = 1
    else
        contained = 0
    end    
    return contained
end

function is_overlapping(sections)
    a,b,c,d = sections
    if (a <= d) && (b >= c)
        overlap = 1
    else 
        overlap = 0
    end
    return overlap
end


# Part one
full_contains = (is_fully_contained ∘ convert_input_to_vector).(data) |> sum


# Part two
overlapping = (is_overlapping ∘ convert_input_to_vector).(data) |> sum




A = data

- =(:)
lines = readlines(A).|>eval∘Meta.parse

# *
fullyin((a,b)) = in.(a,Ref(b))|>all
allin(l) = fullyin(l) || fullyin(reverse(l))

# **
somein((a,b)) = ~isempty(a∩b)

[allin, somein].|>f->count(line->f(line), lines)|>println