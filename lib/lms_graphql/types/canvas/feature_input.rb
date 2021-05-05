require_relative "../canvas_base_input_type"
require_relative "feature_flag"

module LMSGraphQL
  module Types
    module Canvas
      class CanvasFeatureInput < BaseInputObject
          class FeatureAppliesToEnum < ::GraphQL::Schema::Enum
          value "Course"
          value "RootAccount"
          value "Account"
          value "User"
        end
        description "Feature Flags. API Docs: https://canvas.instructure.com/doc/api/feature_flags.html"
      argument :feature, String, "The symbolic name of the feature, used in FeatureFlags.Example: fancy_wickets", required: false
      argument :display_name, String, "The user-visible name of the feature.Example: Fancy Wickets", required: false
      argument :applies_to, FeatureAppliesToEnum, "The type of object the feature applies to (RootAccount, Account, Course, or User):
 * RootAccount features may only be controlled by flags on root accounts.
 * Account features may be controlled by flags on accounts and their parent accounts.
 * Course features may be controlled by flags on courses and their parent accounts.
 * User features may be controlled by flags on users and site admin only..Example: Course", required: false
      argument :enable_at, LMSGraphQL::Types::DateTimeType, "The date this feature will be globally enabled, or null if this is not planned. (This information is subject to change.).Example: 2014-01-01T00:00:00Z", required: false
      argument :feature_flag, LMSGraphQL::Types::Canvas::CanvasFeatureFlagInput, "The FeatureFlag that applies to the caller.Example: fancy_wickets, allowed", required: false
      argument :root_opt_in, Boolean, "If true, a feature that is 'allowed' globally will be 'off' by default in root accounts. Otherwise, root accounts inherit the global 'allowed' setting, which allows sub-accounts and courses to turn features on with no root account action..Example: true", required: false
      argument :beta, Boolean, "Whether the feature is a beta feature. If true, the feature may not be fully polished and may be subject to change in the future..Example: true", required: false
      argument :autoexpand, Boolean, "Whether the details of the feature are autoexpanded on page load vs. the user clicking to expand..Example: true", required: false
      argument :development, Boolean, "Whether the feature is in active development. Features in this state are only visible in test and beta instances and are not yet available for production use..", required: false
      argument :release_notes_url, String, "A URL to the release notes describing the feature.Example: http://canvas.example.com/release_notes#fancy_wickets", required: false

      end
    end
  end
end