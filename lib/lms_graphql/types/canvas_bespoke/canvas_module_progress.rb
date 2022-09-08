require_relative "../canvas_base_type"

module LMSGraphQL
  module Types
    module CanvasBespoke
      class CanvasModuleProgress < LMSGraphQL::Types::Canvas::BaseType
        description "progress for a specific user in a course"
        field :requirement_count, Int, "", null: true
        field :requirement_completed_count, Int, "", null: true
        field :next_requirement_url, String, "URL for the next requirement", null: true
        field :completed_at, GraphQL::Types::ISO8601DateTime, "Date the moduele was completed", null: true
      end
    end
  end
end
