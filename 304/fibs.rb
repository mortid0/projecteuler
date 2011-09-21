#!/usr/bin/ruby
require "rubygems"
require "memoize"
include Memoize
memoize(:f)
M=1234567891011
def f n
  n2=n>>1
  n<3 ? 1 : n&1==1 ? (f(n2)**2+f(n2+1)**2)%M : (f(n2)*(f(n2+1)+f(n2-1)))%M
end
 
p f 10**14-1
p f 10**14

