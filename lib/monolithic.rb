# frozen_string_literal: true

require_relative "monolithic/version"

module Monolithic
  class Error < StandardError; end
  # Your code goes here...
end

require "monolithic/railtie" if defined?(Rails)
