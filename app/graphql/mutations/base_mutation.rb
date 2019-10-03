module Mutations
  class BaseMutation < GraphQL::Schema::Mutation
    null false
    def self.one
      1
    end

    def self.two
      1 + 1
    end
  end
end
