module Types
  class QueryType < Types::BaseObject
    # Add `node(id: ID!) and `nodes(ids: [ID!]!)`
    include GraphQL::Types::Relay::HasNodeField
    include GraphQL::Types::Relay::HasNodesField

    # Add root-level fields here.
    # They will be entry points for queries on your schema.

    # Without arguments
    # {
    #   testFieldNoArgs
    # }
    field :test_field_no_args, String, null: false,
      description: "Without arguments"
    def test_field_no_args
      "Hello World!"
    end

    # With arguments
    # {
    #  testFieldWithArgs(name: "Camila")
    # }
    field :test_field_with_args, String, null: false,
      description: "With arguments" do
        argument :name, String, required: true
    end

    def test_field_with_args(name:)
      Rails.logger.info context[:time]
      "Hello World! #{name}"
    end

    field :author, Types::AuthorType, null: true, description: 'One author' do
      argument :id, ID, required: true
    end

    def author(id:)
      Author.where(id:).first
    end

    field :authors, [Types::AuthorType], null: true, description: 'Array of authors'

    def authors
      Author.all
    end

    # How to show:
    #
    # {
    #   authors {
    #     lastName
    #   },
    #   testFieldNoArgs,
    #   testFieldWithArgs(name: "Camila"),
    #   author(id: 1){
    #     id
    #     first_name
    #     lastName
    #     yob
    #     createdAt
    #     fullName
    #     description
    #     coordinates{
    #       latitude
    #       longitude
    #     }
    #     publicationYears
    #   }
    # }
  end
end
