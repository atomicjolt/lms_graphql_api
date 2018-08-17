require_relative "../canvas_base_mutation"
require_relative "../../types/canvas/proficiency"
module LMSGraphQL
  module Mutations
    module Canvas
      class CreateUpdateProficiencyRating < BaseMutation
        argument :account_id, ID, required: true
        argument :ratings_description, String, required: false
        argument :ratings_points, Int, required: false
        argument :ratings_mastery, Int, required: false
        argument :ratings_color, Int, required: false
        field :proficiency, LMSGraphQL::Types::Canvas::CanvasProficiency, null: false
        def resolve(account_id:, ratings_description: nil, ratings_points: nil, ratings_mastery: nil, ratings_color: nil)
          context[:canvas_api].call("CREATE_UPDATE_PROFICIENCY_RATINGS").proxy(
            "CREATE_UPDATE_PROFICIENCY_RATINGS",
            {
              "account_id": account_id,
              "ratings[description]": ratings_description,
              "ratings[points]": ratings_points,
              "ratings[mastery]": ratings_mastery,
              "ratings[color]": ratings_color            },
            nil,
          ).parsed_response
        end
      end
    end
  end
end