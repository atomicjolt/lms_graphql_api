require_relative "../canvas_base_type"


module LMSGraphQL
  module Types
    module Canvas
      class CanvasBlackoutDate < BaseType
          description "Blackout Dates. API Docs: https://canvas.instructure.com/doc/api/blackout_dates.html"
        field :id, ID, "the ID of the blackout date.Example: 1", null: true
        field :context_id, ID, "the context owning the blackout date.Example: 1", null: true
        field :context_type, String, "Example: Course", null: true
        field :start_date, GraphQL::Types::ISO8601DateTime, "the start date of the blackout date.Example: 2022-01-01", null: true
        field :end_date, GraphQL::Types::ISO8601DateTime, "the end date of the blackout date.Example: 2022-01-02", null: true
        field :event_title, String, "title of the blackout date.Example: some title", null: true

      end
    end
  end
end