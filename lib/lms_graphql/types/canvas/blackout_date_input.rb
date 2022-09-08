require_relative "../canvas_base_input_type"


module LMSGraphQL
  module Types
    module Canvas
      class CanvasBlackoutDateInput < BaseInputObject
          description "Blackout Dates. API Docs: https://canvas.instructure.com/doc/api/blackout_dates.html"
        argument :id, ID, "the ID of the blackout date.Example: 1", required: false
        argument :context_id, ID, "the context owning the blackout date.Example: 1", required: false
        argument :context_type, String, "Example: Course", required: false
        argument :start_date, GraphQL::Types::ISO8601DateTime, "the start date of the blackout date.Example: 2022-01-01", required: false
        argument :end_date, GraphQL::Types::ISO8601DateTime, "the end date of the blackout date.Example: 2022-01-02", required: false
        argument :event_title, String, "title of the blackout date.Example: some title", required: false

      end
    end
  end
end