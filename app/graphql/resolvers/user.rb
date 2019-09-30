module Resolvers
  class UserResolver < Resolvers::Base
    def resolve()
      # call your application logic here:
      User.first()
    end
  end
end
