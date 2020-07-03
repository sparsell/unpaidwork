require 'pry'
require 'httparty'
require 'json'
# require 'word_wrap/core_ext'

require_relative "unpaidwork/version"
require_relative "unpaidwork/cli"
require_relative "unpaidwork/api"
require_relative "unpaidwork/country"

module Unpaidwork
  class Error < StandardError; end
  # Your code goes here...
end
