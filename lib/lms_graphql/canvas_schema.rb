require "graphql"
require_relative "types/canvas_forward_declarations"
require_relative "mutations/canvas/mutations"
require_relative "types/canvas/query_type"

module LMSGraphQL
  module Types
    module Canvas
      class Schema < ::GraphQL::Schema
        mutation LMSGraphQL::Mutations::Canvas::MutationType
        query LMSGraphQL::Types::Canvas::QueryType
      end
    end
  end
end
