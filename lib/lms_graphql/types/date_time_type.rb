module LMSGraphQL
  module Types
    class DateTimeType < ::GraphQL::Schema::Scalar
      graphql_name "DateTime"

      def self.coerce_input(value, _ctx)
        return if !value

        Time.zone.parse(value)
      end

      def self.coerce_result(value, _ctx)
        return if !value

        if value.is_a? String
          value = Time.zone.parse(value)
        end
        value.utc.iso8601
      end
    end
  end
end
