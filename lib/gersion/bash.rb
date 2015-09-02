module Gersion
  module Bash
    def self.run command
      `#{command}`
    end
  end
end
