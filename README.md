# Advent of Code 2022 in Haskell

<https://adventofcode.com/2022>

I've decided to get familiar with Haskell during this December. 
I have experience in multiple "traditional" languages, and I see the value of using a functional style
whenever appropriate, but I've never used a truly functional language before. So let's see what can be learned from this exercise. 

## Day 1


Day 1 was quite painful. I've been going through a few tutorials, and I think I'm familiar with the general ideas, but there's lots of syntax and tooling to learn. 

Most important concepts learned:
- Talking to STDIN/STDOUT with `interact`
- Different ways to define and call functions
- Pattern matching in functions


The main goal I'm setting for myself is to solve all challenges. 
I will allow suboptimal and less than elegant solutions until I feel confident with the basics.   


## Day 2

Much easier than day 1, mostly repetition of yesterday's concepts. 



## Day 3


Learning the `` syntax. 

Imported Sets, since I assumed it was a good idea. But maybe intersects between lists would be more reasonable. 

Still uncomfortable with the `.` syntax. Not sure when it's appropriate to use. 
I'm seeing ways to refactor and improve the solution, but resisting the temptation for now. 

Found the `foldr1` function, which seems to simplify folds significantly, will try in the future. 


---

Own notes:

	Ubuntu:
	apt install haskell-stack

	stack init
	stack build
	stack exec advent-exe

	https://github.com/rikvdkleij/intellij-haskell/blob/master/README.md

