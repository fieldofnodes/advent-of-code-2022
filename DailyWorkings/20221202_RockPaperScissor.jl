using Pkg
Pkg.activate(".")
using Revise
using DelimitedFiles
using Chain

function play_rps_r1(abc,xyz)
    function bool_relation(m,n)
        bool_res = (abc == m && xyz == n)
        return bool_res
    end
    

    if bool_relation("A","X") 
        outcome = 3
        move = 1
    elseif bool_relation("A","Y")
        outcome = 6
        move = 2
    elseif bool_relation("A","Z")
        outcome = 0
        move = 3
    elseif bool_relation("B","X")
        outcome = 0
        move = 1
    elseif bool_relation("B","Y")
        outcome = 3
        move = 2
    elseif bool_relation("B","Z")
        outcome = 6
        move = 3
    elseif bool_relation("C","X")
        outcome = 6
        move = 1
    elseif bool_relation("C","Y")
        outcome = 0
        move = 2
    elseif bool_relation("C","Z")
        outcome = 3
        move = 3
    else
        x = print("No")
    end
    
    points = outcome + move
    return points
end


function play_rps_r2(abc,xyz)
    function bool_relation(m,n)
        bool_res = (abc == m && xyz == n)
        return bool_res
    end
    

    if bool_relation("A","X") 
        outcome = 0
        move = 3
    elseif bool_relation("A","Y")
        outcome = 3
        move = 1
    elseif bool_relation("A","Z")
        outcome = 6
        move = 2
    elseif bool_relation("B","X")
        outcome = 0
        move = 1
    elseif bool_relation("B","Y")
        outcome = 3
        move = 2
    elseif bool_relation("B","Z")
        outcome = 6
        move = 3
    elseif bool_relation("C","X")
        outcome = 0
        move = 2
    elseif bool_relation("C","Y")
        outcome = 3
        move = 3
    elseif bool_relation("C","Z")
        outcome = 6
        move = 1
    else
        x = print("No")
    end
    
    points = outcome + move
    return points
end


data_path = "DailyData/20221202_RockPaperScissor.txt"
data = readdlm(data_path)


# Part One
total_points_r1 = sum([play_rps_r1(data[i,1],data[i,2]) for i in eachrow(data).iter])


# Part Two
total_points_r2 = sum([play_rps_r2(data[i,1],data[i,2]) for i in eachrow(data).iter])