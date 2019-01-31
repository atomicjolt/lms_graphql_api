require_relative "../canvas_base_resolver"
require_relative "../../types/canvas/page"
module LMSGraphQL
  module Resolvers
    module Canvas
      class ListPagesCourse < CanvasBaseResolver
        type [LMSGraphQL::Types::Canvas::CanvasPage], null: false
        argument :get_all, Boolean, required: false
        argument :course_id, ID, required: true
        argument :sort, String, required: false
        argument :order, String, required: false
        argument :search_term, String, required: false
        argument :published, Boolean, required: false
        def resolve(course_id:, sort: nil, order: nil, search_term: nil, published: nil, get_all: false)
          result = context[:canvas_api].call("LIST_PAGES_COURSES").proxy(
            "LIST_PAGES_COURSES",
            {
              "course_id": course_id,
              "sort": sort,
              "order": order,
              "search_term": search_term,
              "published": published            },
            nil,
            get_all,
          )
          get_all ? result : result.parsed_response
        end
      end
    end
  end
end