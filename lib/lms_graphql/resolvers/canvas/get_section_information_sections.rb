require_relative "../canvas_base_resolver"
require_relative "../../types/canvas/section"
module LMSGraphQL
  module Resolvers
    module Canvas
      class GetSectionInformationSection < CanvasBaseResolver
        type LMSGraphQL::Types::Canvas::CanvasSection, null: false
        argument :id, ID, required: true
        argument :include, String, required: false
        def resolve(id:, include: nil, get_all: false)
          result = context[:canvas_api].call("GET_SECTION_INFORMATION_SECTIONS").proxy(
            "GET_SECTION_INFORMATION_SECTIONS",
            {
              "id": id,
              "include": include            },
            nil,
            get_all,
          )
          get_all ? result : result.parsed_response
        end
      end
    end
  end
end