require_relative "../canvas_base_resolver"
require_relative "../../types/canvas/collaborator"
module LMSGraphQL
  module Resolvers
    module Canvas
      class ListMembersOfCollaboration < CanvasBaseResolver
        type [LMSGraphQL::Types::Canvas::CanvasCollaborator], null: false
        argument :get_all, Boolean, required: false
        argument :id, ID, required: true
        argument :include, [String], required: false
        def resolve(id:, include: nil, get_all: false)
          result = context[:canvas_api].call("LIST_MEMBERS_OF_COLLABORATION").proxy(
            "LIST_MEMBERS_OF_COLLABORATION",
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