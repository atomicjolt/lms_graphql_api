require_relative "../canvas_base_resolver"
require_relative "../../types/canvas/media_object"
module LMSGraphQL
  module Resolvers
    module Canvas
      class ListMediaObjectsCourse < CanvasBaseResolver
        type [LMSGraphQL::Types::Canvas::CanvasMediaObject], null: false
        argument :get_all, Boolean, required: false
        argument :course_id, ID, required: true
        argument :sort, String, required: false
        argument :order, String, required: false
        argument :exclude, String, required: false
        def resolve(course_id:, sort: nil, order: nil, exclude: nil, get_all: false)
          result = context[:canvas_api].call("LIST_MEDIA_OBJECTS_COURSES").proxy(
            "LIST_MEDIA_OBJECTS_COURSES",
            {
              "course_id": course_id,
              "sort": sort,
              "order": order,
              "exclude": exclude            },
            nil,
            get_all,
          )
          get_all ? result : result.parsed_response
        end
      end
    end
  end
end