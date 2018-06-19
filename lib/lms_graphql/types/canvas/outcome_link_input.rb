require_relative "../canvas_base_input_type"
require_relative "outcome_group"
require_relative "outcome"

module LMSGraphQL
  module Types
    module Canvas
      class CanvasOutcomeLinkInput < BaseInputObject
        description "Outcome Groups. API Docs: https://canvas.instructure.com/doc/api/outcome_groups.html"
        argument :url, String, "the URL for fetching/updating the outcome link. should be treated as opaque.Example: /api/v1/accounts/1/outcome_groups/1/outcomes/1", required: false
        argument :context_id, ID, "the context owning the outcome link. will match the context owning the outcome group containing the outcome link; included for convenience. may be null for links in global outcome groups..Example: 1", required: false
        argument :context_type, String, "Example: Account", required: false
        argument :outcome_group, LMSGraphQL::Types::Canvas::CanvasOutcomeGroupInput, "an abbreviated OutcomeGroup object representing the group containing the outcome link..", required: false
        argument :outcome, LMSGraphQL::Types::Canvas::CanvasOutcomeInput, "an abbreviated Outcome object representing the outcome linked into the containing outcome group..", required: false
        argument :assessed, Boolean, "whether this outcome has been used to assess a student in the context of this outcome link.  In other words, this will be set to true if the context is a course, and a student has been assessed with this outcome in that course..Example: true", required: false
        argument :can_unlink, Boolean, "whether this outcome link is manageable and is not the last link to an aligned outcome.", required: false

      end
    end
  end
end