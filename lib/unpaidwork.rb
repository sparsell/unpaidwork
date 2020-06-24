require 'pry'
require 'httparty'
require 'json'

require_relative "unpaidwork/version"
require_relative "unpaidwork/cli"
require_relative "unpaidwork/api"
require_relative "unpaidwork/unpaidwork"

module Unpaidwork
  class Error < StandardError; end
  # Your code goes here...
end
