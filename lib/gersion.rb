require_relative "gersion/bash"
require_relative "gersion/file"
require_relative "gersion/version"

module Gersion

  def self.current_version
    the_current_tag || the_current_sha
  end

  def self.version_of gem
    regex = Regexp.new("  #{gem} \\(([01234567890\.]*)\\)")
    git_match = gemlock_content.split('GEM')[0].split('GIT').reject { |x| x.scan(regex)[0].nil? }.first
    if git_match
      tag_regex = /tag: (.*)/
      if tag_result = git_match.scan(tag_regex)[0][0]
        return tag_result
      end
    end
    gemlock_content.scan(regex)[0][0]
  end

  class << self
    private

    def gemlock_content
      @gemlock_content ||= Gersion::File.read('Gemfile.lock')
    end

    def the_current_tag
      Gersion::Bash.run('git tag --points-at HEAD').split("\n")[0]
    end

    def the_current_sha
      Gersion::Bash.run('git rev-list -1 HEAD').split("\n")[0]
    end
  end

end
