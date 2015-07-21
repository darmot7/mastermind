# mastermind
A mastermind Solver that solves Mastermind Soltuions in 4.6 guesses.

written in Ruby by Jeremy Herzberg (jeremy.herzberg@gmail.com)

Algorithm help from https://en.wikipedia.org/wiki/Mastermind_(board_game)#Algorithms

To run this application cd to the dir you have master_mind.app.rb and type "ruby master_mind_app.rb" 

To use the test methods, make sure you comment out lines 101 and 102 of master_mind_app.rb

Have a wonderful day!

TO-DO:

1) There are MANY optimizations available in this code. For example, sometimes I'll call array.count(3) multiple times in a method. I believe ruby actually counts each time the method is called and to make the app take less time to run I should limit these extra method calls. These redundancies are purely a function of building this app while learning Ruby for the first time.


2) To reduce the complexity of read_pegs a well thought out accounting solution could be used. Right now, the complexity of read_pegs is probabaly at least O(n^2) with a large constant. I say probably because of how Ruby obscures complexity for me right now (since I am so new to Ruby).
