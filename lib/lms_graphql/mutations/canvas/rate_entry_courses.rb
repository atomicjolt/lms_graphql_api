require_relative "../canvas_base_mutation"

module LMSGraphQL
  module Mutations
    module Canvas
      class RateEntryCourse < BaseMutation
        argument :course_id, ID, required: true
        argument :topic_id, ID, required: true
        argument :entry_id, ID, required: true
        argument :rating, Int, required: false
        
        
        field :return_value, Boolean, null: false
        
        def resolve(course_id:, topic_id:, entry_id:, rating: nil)
          context[:canvas_api].call("RATE_ENTRY_COURSES").proxy(
            "RATE_ENTRY_COURSES",
            {
              "course_id": course_id,
              "topic_id": topic_id,
              "entry_id": entry_id
            },
            {
              "rating": rating
            },
          ).parsed_response
        end
      end
    end
  end
end