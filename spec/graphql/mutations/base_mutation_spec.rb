require "rails_helper"
require "spec_helper"
require "graphql"

module Mutations
  class BaseMutation
    RSpec.describe BaseMutation do
      describe "#one" do
        it "equals 1" do
          expect(BaseMutation.one === 1)
        end
      end

      describe "#two" do
        it "equals 2" do
          expect(BaseMutation.two === 2)
        end
      end
    end
  end
end

