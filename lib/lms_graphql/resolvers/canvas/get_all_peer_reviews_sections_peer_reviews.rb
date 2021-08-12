require_relative "../canvas_base_resolver"
require_relative "../../types/canvas/peer_review"
module LMSGraphQL
  module Resolvers
    module Canvas
      class GetAllPeerReviewsSectionsPeerReview < CanvasBaseResolver
        type [LMSGraphQL::Types::Canvas::CanvasPeerReview], null: false
        argument :get_all, Boolean, required: false
        argument :section_id, ID, required: true
        argument :assignment_id, ID, required: true
        argument :include, [String], required: false
        def resolve(section_id:, assignment_id:, include: nil, get_all: false)
          result = context[:canvas_api].call("GET_ALL_PEER_REVIEWS_SECTIONS_PEER_REVIEWS").proxy(
            "GET_ALL_PEER_REVIEWS_SECTIONS_PEER_REVIEWS",
            {
              "section_id": section_id,
              "assignment_id": assignment_id,
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