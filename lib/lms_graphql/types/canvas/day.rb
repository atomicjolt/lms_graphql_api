require_relative "../canvas_base_type"


module LMSGraphQL
  module Types
    module Canvas
      class CanvasDay < BaseType
          description "Gradebook History. API Docs: https://canvas.instructure.com/doc/api/gradebook_history.html"
        field :date, GraphQL::Types::ISO8601DateTime, "the date represented by this entry.Example: 1986-08-09", null: true
        field :graders, Int, "an array of the graders who were responsible for the submissions in this response. the submissions are grouped according to the person who graded them and the assignment they were submitted for..Example: []", null: true

      end
    end
  end
end