module Types
  class QueryType < Types::BaseObject
    # Add root-level fields here.
    # They will be entry points for queries on your schema.

    # TODO: remove me
    field :test_field, String, null: false,
      description: "An example field added by the generator"
    def test_field
      "Hello World!"
    end

    field :lunches, !types[Types::LunchType] do
      argument :sort_by, types.String, default_value: 'UPCOMING'
      resolve -> (obj, args, ctx) {
        Lunches.all
      }
    end
  end
end
