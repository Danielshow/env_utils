# frozen_string_literal: true

require "bundler/gem_tasks"
require "rubocop/rake_task"
require "rspec/core/rake_task"

RuboCop::RakeTask.new

task default: :rubocop

RSpec::Core::RakeTask.new(:spec)
