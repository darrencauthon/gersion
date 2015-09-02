require "gersion/bash"
require "gersion/version"

module Gersion

  def self.current_version
    result = Gersion::Bash.run('git tag --points-at HEAD').split("\n")[0]
    result || Gersion::Bash.run('git rev-list -1 HEAD').split("\n")[0]
  end

end
