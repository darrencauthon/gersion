require_relative "gersion/bash"
require_relative "gersion/version"

module Gersion

  def self.current_version
    the_current_tag || the_current_sha
  end

  class << self
    private

    def the_current_tag
      Gersion::Bash.run('git tag --points-at HEAD').split("\n")[0]
    end

    def the_current_sha
      Gersion::Bash.run('git rev-list -1 HEAD').split("\n")[0]
    end
  end

end
