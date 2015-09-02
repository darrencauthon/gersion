require_relative 'spec_helper'

describe Gersion do

  describe "current version" do

    describe "the current version is bound to a tag" do

      let(:tag) { random_string }

      before do
        Gersion::Bash.stubs(:run)
          .with('git tag --points-at HEAD')
          .returns "#{tag}\n#{random_string}"
      end

      it "should return the tag" do
        Gersion.current_version.must_equal tag
      end

    end

  end

end
