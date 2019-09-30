module Types
  class QueryType < Types::BaseObject
    # Add root-level fields here.
    # They will be entry points for queries on your schema.

    field :lunches, [Types::LunchType], null: false do
      argument :sort_by, String, default_value: 'UPCOMING', required: true
    end

    def lunches(arg)
        Lunch.all.order(:date)
    end
  end
end
