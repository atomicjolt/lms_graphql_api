require_relative "../canvas_base_input_type"


module LMSGraphQL
  module Types
    module Canvas
      class CanvasePortfolioPageInput < BaseInputObject
          description "ePortfolios. API Docs: https://canvas.instructure.com/doc/api/e_portfolios.html"
        argument :id, ID, "The database ID of the ePortfolio.Example: 1", required: false
        argument :eportfolio_id, ID, "The ePortfolio ID to which the entry belongs.Example: 1", required: false
        argument :position, Int, "The positional order of the entry in the list.Example: 1", required: false
        argument :name, String, "The name of the ePortfolio.Example: My Academic Journey", required: false
        argument :content, String, "The user entered content of the entry.Example: A long time ago.", required: false
        argument :created_at, GraphQL::Types::ISO8601DateTime, "The creation timestamp for the ePortfolio.Example: 2021-09-20T18:59:37Z", required: false
        argument :updated_at, GraphQL::Types::ISO8601DateTime, "The timestamp of the last time any of the ePortfolio attributes changed.Example: 2021-09-20T18:59:37Z", required: false

      end
    end
  end
end