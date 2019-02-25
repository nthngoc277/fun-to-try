# print an array of the first  palindromic prime numbers
# For example, the first 10 palindromic prime numbers are [2, 3, 5, 7, 11, 101, 131, 151, 181, 191].

# method 1
palindrome = -> (num) {
  num.to_s == num.to_s.reverse
}

prime = -> (num) {
  num < 2 || 2..Math.sqrt(num).any? { |n| num % n == 0} ? false : true
}

print 2.upto(Float::INFINITY).lazy.select { |n|
  palindrom.(n) && prime.(n)
}.first(gets.to_i).to_a

#method 2
require 'prime'
n = gets.to_i # get user input
Prime.each.lazy.select{ |num| num == num.to_s.reverse.to_i }.first(n)