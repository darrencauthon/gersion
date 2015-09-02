require_relative '../lib/gersion'
require 'minitest/autorun'
require 'minitest/spec'
require 'securerandom'
require 'mocha/setup'

def random_string
  SecureRandom.uuid
end
