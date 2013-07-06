require "capistrano/ext/multistage"
require "bundler/capistrano" #Using bundler with Capistrano
require "capistrano-unicorn"

set :stages, %w(staging production)
set :default_stage, "production"

log_formatters = [
  { :match => /command finished/, :color => :hide, :priority => 10 },
  { :match => /executing comman/, :color => :bule, :priority => 10, :style => :underscore },
  { :match => /^transaction: commit$/, :color => :magenta, :priority => 10, :style => :blank }
]

log_formatter(log_formatters)
