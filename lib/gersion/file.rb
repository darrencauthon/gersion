module Gersion
  module File
    def self.read file
      ::File.open(file).read
    end
  end
end
