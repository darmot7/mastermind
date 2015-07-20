# mastermind
A mastermind Solver that solves Mastermind Soltuions in 4.6 guesses.

written in Ruby by Jeremy Herzberg (jeremy.herzberg@gmail.com)

Algorithm help from https://en.wikipedia.org/wiki/Mastermind_(board_game)#Algorithms

To run this application cd to the dir you have master_mind.app.rb and type "ruby master_mind_app.rb" 

There is a sneaky bug in this app. About 6% of the time I have to reset all_permutations and I am unsure as to why I have to do it. My algorithm is solid but there must be a bug that I am not aware of in my implementation. I am working on it. With the fix in place, it runs 100% of the time.


TO-DO/Futurework

1. FIX THE BUG

2.There are MANY optimizations available in this code. For example, sometimes I'll call array.count(3) multiple times in a method. I believe ruby actually counts each time the method is called and to make the app take less time to run I should limit these extra method calls. These redundancies are purely a function of building this app while learning Ruby for the first time.
