require_relative 'spec_helper'

describe Gersion do

  describe "current version" do

    before do
      Gersion::Bash.stubs(:run)
        .with('git tag --points-at HEAD')
        .returns head_tag_check_result
    end

    describe "the current version is bound to a tag" do

      let(:tag) { random_string }

      let(:head_tag_check_result) { "#{tag}\n#{random_string}" }

      it "should return the tag" do
        Gersion.current_version.must_equal tag
      end

    end

    describe "the current version is NOT bound to a tag" do

      let(:head_tag_check_result) { "" }

      describe "but it has a current sha key" do

        let(:sha) { random_string }

        before do
          Gersion::Bash.stubs(:run)
            .with('git rev-list -1 HEAD')
            .returns "#{sha}\n#{random_string}"
        end

        it "should return the sha" do
          Gersion.current_version.must_equal sha
        end

      end

    end

  end

end
