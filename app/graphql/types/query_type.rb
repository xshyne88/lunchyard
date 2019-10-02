Types::QueryType = GraphQL::ObjectType.define do
  name 'Query'
    connection :lunches, Types::LunchType.connection_type do
      argument :sortBy, types.String, 'Column to sort results', as: :sort_by, default_value: 'UPCOMING'
      resolve -> (obj, args, ctx) {
        Lunch.all()
      }
    end
  end
