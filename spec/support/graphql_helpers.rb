module GraphQLHelpers
  def execute(query, variables: {})
    LunchyardSchema.execute(
      query,
      variables: variables.with_indifferent_access,
      context: {}
    ).with_indifferent_access
  end
end
