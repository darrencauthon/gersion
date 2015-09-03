require_relative "gersion/bash"
require_relative "gersion/file"
require_relative "gersion/version"

module Gersion

  def self.current_version
    the_current_tag || the_current_sha
  end

  def self.version_of gem
    regex = Regexp.new("  #{gem} \\(([01234567890\.]*)\\)")
    if git_match = gemlock_content.split('GEM')[0].split('GIT').reject { |x| x.scan(regex)[0].nil? }.first
      if result = find_the_match_between(git_match, /tag: (.*)/) || find_the_match_between(git_match, /revision: (.*)/)
        return result
      end
    end
    find_the_match_between gemlock_content, regex
  end

  class << self
    private

    def gemlock_content
      @gemlock_content ||= Gersion::File.read('Gemfile.lock')
    end

    def find_the_match_between content, regex
      content.scan(regex)[0][0]
    rescue
      nil
    end

    def the_current_tag
      Gersion::Bash.run('git tag --points-at HEAD').split("\n")[0]
    end

    def the_current_sha
      Gersion::Bash.run('git rev-list -1 HEAD').split("\n")[0]
    end
  end

end
