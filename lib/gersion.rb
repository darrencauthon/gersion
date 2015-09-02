require "gersion/bash"
require "gersion/version"

module Gersion

  def self.current_version
    Gersion::Bash.run('git tag --points-at HEAD').split("\n")[0]
  end

end
