require_relative "../canvas_base_mutation"
require_relative "../../types/canvas/page"
module LMSGraphQL
  module Mutations
    module Canvas
      class DuplicatePage < BaseMutation
        argument :course_id, ID, required: true
        argument :url_or_id, ID, required: true
        
        
        field :page, LMSGraphQL::Types::Canvas::CanvasPage, null: false
        
        def resolve(course_id:, url_or_id:)
          context[:canvas_api].call("DUPLICATE_PAGE").proxy(
            "DUPLICATE_PAGE",
            {
              "course_id": course_id,
              "url_or_id": url_or_id
            },
            {},
          ).parsed_response
        end
      end
    end
  end
end