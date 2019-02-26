require_relative "../canvas_base_mutation"
require_relative "../../types/canvas/page"
module LMSGraphQL
  module Mutations
    module Canvas
      class DuplicatePage < BaseMutation
        argument :course_id, ID, required: true
        argument :url, String, required: true
        field :page, LMSGraphQL::Types::Canvas::CanvasPage, null: false
        def resolve(course_id:, url:)
          context[:canvas_api].call("DUPLICATE_PAGE").proxy(
            "DUPLICATE_PAGE",
            {
              "course_id": course_id,
              "url": url
            },
            {},
          ).parsed_response
        end
      end
    end
  end
end