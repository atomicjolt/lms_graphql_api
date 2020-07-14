require_relative "../canvas_base_resolver"
require_relative "../../types/canvas/media_object"
module LMSGraphQL
  module Resolvers
    module Canvas
      class ListMediaObjectsMediaObject < CanvasBaseResolver
        type [LMSGraphQL::Types::Canvas::CanvasMediaObject], null: false
        argument :get_all, Boolean, required: false
        argument :sort, String, required: false
        argument :order, String, required: false
        argument :exclude, String, required: false
        def resolve(sort: nil, order: nil, exclude: nil, get_all: false)
          result = context[:canvas_api].call("LIST_MEDIA_OBJECTS_MEDIA_OBJECTS").proxy(
            "LIST_MEDIA_OBJECTS_MEDIA_OBJECTS",
            {
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