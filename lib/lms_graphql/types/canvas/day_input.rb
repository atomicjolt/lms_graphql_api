require_relative "../canvas_base_input_type"


module LMSGraphQL
  module Types
    module Canvas
      class CanvasDayInput < BaseInputObject
        description "Gradebook History. API Docs: https://canvas.instructure.com/doc/api/gradebook_history.html"
        argument :date, LMSGraphQL::Types::DateTimeType, "the date represented by this entry.Example: 1986-08-09", required: false
        argument :graders, Int, "an array of the graders who were responsible for the submissions in this response. the submissions are grouped according to the person who graded them and the assignment they were submitted for..Example: []", required: false

      end
    end
  end
end