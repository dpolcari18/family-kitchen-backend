require 'rails_helper'

RSpec.describe "GraphQL", type: :request do

    subject {
        User.create(auth_id: 'authid')
    }
  describe "getUserInfo Query" do
    it 'returns a hash with a user key given a proper id' do
        variable = {id: subject.id}
        query_string = "query getUserInfo($id: Int!) { user (id: $id) { id, families { id, name } } }"
        response = FamilyKitchenBackendSchema.execute(query_string, variables: variable).to_h.symbolize_keys[:data]

        expect(response).to include("user")
    end

    it 'returns an error with message when not provided a valid id' do
        variable = {id: 6}
        query_string = "query getUserInfo($id: Int!) { user (id: $id) { id, families { id, name } } }"
        response = FamilyKitchenBackendSchema.execute(query_string, variables: variable).to_h["errors"][0]
        
        expect(response).to include("message")
    end
  end
end
