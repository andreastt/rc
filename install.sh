#!/usr/bin/env ruby
require 'pathname'

# Colors
{ :green => 32,
  :grey => 37
}.each do |name, code|
  Kernel.instance_eval {define_method(name) {|str| "\e[#{code}m#{str}\e[0m"}}
end

def abs(path)
  Pathname(path).expand_path
end

def system(cmd)
  puts grey(cmd)
  super(cmd)
end

Dir['*'].
  map {|f| abs(f)}.
  reject {|f| f == abs(__FILE__)}.
  each {|f|
    home = abs "~/.#{f.basename}"
    cmd = "ln -is #{f} #{home}"
    system cmd
  }

puts green('Linked dotfiles')
