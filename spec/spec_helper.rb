# frozen_string_literal: true

require 'simplecov'
SimpleCov.start

Dir[File.join(File.dirname(__FILE__), '..', 'challenges', 'shared', '**', '*.rb')].each do |file|
  require file
end

Dir[File.join(File.dirname(__FILE__), '..', 'challenges', '20*', '**', '*.rb')].each do |file|
  require file
end

RSpec.configure do |config|
end
