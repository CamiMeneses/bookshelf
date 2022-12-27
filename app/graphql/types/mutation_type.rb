module Types
  class MutationType < Types::BaseObject
    # First way not so good to create an Author

    # mutation {
    #   createAuthor(firstName: "Ernest", lastName: "Hemingway", yob: 1899, isAlive: false) {
    #     id
    #     fullName
    #   }
    # }

    field :create_author, Types::AuthorType, null: false, description: "Create an Author" do
      argument :first_name, String, required: false
      argument :last_name, String, required: false
      argument :yob, Int, required: false
      argument :is_alive, Boolean, required: false
    end

    def create_author(first_name:, last_name:, yob:, is_alive:)
      Author.create!(first_name: first_name, last_name: last_name, yob: yob, is_alive: is_alive)
    end

    # Second way (Recommended)

    # mutation {
    #   createAnAuthor(firstName: "Ernest", lastName: "Hemingway", yob: 1899, isAlive: false) {
    #     id
    #     fullName
    #   }
    # }

    field :create_an_author, Types::AuthorType, mutation: Mutations::CreateAnAuthor

    # Another way to send the request with QUERY PARAMS

    # mutation createAnAuthor($first_name:String, $last_name:String, $yob:Int, $is_alive:Boolean){
    #   createAnAuthor(firstName: $first_name, lastName: $last_name, yob: $yob, isAlive: $is_alive) {
    #     id
    #     fullName
    #   }
    # }

    # And in query params section:

    # {
    #   "first_name": "Connie",
    #   "last_name": "Wills",
    #   "yob": 1945,
    #   "is_alive": true
    # }

    # To use this type: Types::AuthorInputType

    # mutation createAnAuthor($author:AuthorInputType!){
    #   createAnAuthor(author: $author) {
    #     id
    #     fullName
    #   }
    # }

    # {
    #   "author": {
    #       "firstName": "Connie2",
    #       "lastName": "Wills2",
    #       "yob": 1945,
    #       "isAlive": true
    #   }
    # }
  end
end
