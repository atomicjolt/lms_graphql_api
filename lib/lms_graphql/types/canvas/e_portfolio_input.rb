require_relative "../canvas_base_input_type"


module LMSGraphQL
  module Types
    module Canvas
      class CanvasePortfolioInput < BaseInputObject
          description "ePortfolios. API Docs: https://canvas.instructure.com/doc/api/e_portfolios.html"
      argument :id, ID, "The database ID of the ePortfolio.Example: 1", required: false
      argument :user_id, ID, "The user ID to which the ePortfolio belongs.Example: 1", required: false
      argument :name, String, "The name of the ePortfolio.Example: My Academic Journey", required: false
      argument :public, Boolean, "Whether or not the ePortfolio is visible without authentication.Example: true", required: false
      argument :created_at, LMSGraphQL::Types::DateTimeType, "The creation timestamp for the ePortfolio.Example: 2021-09-20T18:59:37Z", required: false
      argument :updated_at, LMSGraphQL::Types::DateTimeType, "The timestamp of the last time any of the ePortfolio attributes changed.Example: 2021-09-20T18:59:37Z", required: false
      argument :workflow_state, String, "The state of the ePortfolio. Either 'active' or 'deleted'.Example: active", required: false
      argument :deleted_at, LMSGraphQL::Types::DateTimeType, "The timestamp when the ePortfolio was deleted, or else null.Example: 2021-09-20T18:59:37Z", required: false
      argument :spam_status, String, "A flag indicating whether the ePortfolio has been
      flagged or moderated as spam. One of 'flagged_as_possible_spam',
      'marked_as_safe', 'marked_as_spam', or null.", required: false

      end
    end
  end
end