require_relative "../canvas_base_resolver"
require_relative "../../types/canvas/file"
module LMSGraphQL
  module Resolvers
    module Canvas
      class ListFilesUser < CanvasBaseResolver
        type [LMSGraphQL::Types::Canvas::CanvasFile], null: false
        argument :get_all, Boolean, required: false
        argument :user_id, ID, required: true
        argument :content_types, String, required: false
        argument :search_term, String, required: false
        argument :include, String, required: false
        argument :only, [String], required: false
        argument :sort, String, required: false
        argument :order, String, required: false
        def resolve(user_id:, content_types: nil, search_term: nil, include: nil, only: nil, sort: nil, order: nil, get_all: false)
          result = context[:canvas_api].call("LIST_FILES_USERS").proxy(
            "LIST_FILES_USERS",
            {
              "user_id": user_id,
              "content_types": content_types,
              "search_term": search_term,
              "include": include,
              "only": only,
              "sort": sort,
              "order": order            },
            nil,
            get_all,
          )
          get_all ? result : result.parsed_response
        end
      end
    end
  end
end