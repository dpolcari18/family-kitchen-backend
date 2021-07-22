require 'rails_helper'

RSpec.describe "GraphQL", type: :request do

    let(:user) { User.create(auth_id: 'fakeid')}
    let(:variable) { {id: user.id} }
    let(:query_string) { "query getUserInfo($id: Int!) { user (id: $id) { id, families { id, name } } }" }
    let(:response) { FamilyKitchenBackendSchema.execute(query_string, variables: variable).to_h }

    describe "getUserInfo Query" do
        it 'returns a hash with a user key given a proper id' do
            expect(response["data"]).to include("user")
        end

        it 'returns an error with message when not provided a valid id' do
            variable[:id] = 1
            expect(response["errors"][0]).to include("message")
        end

        it 'returns a list of families the user is a part of' do
            family = Family.create(name: 'New Family')
            user_family = UserFamily.create(user_id: user.id, family_id: family.id, head: true)

            expect(response['data']['user']['families']).to be_an(Array) 
        end
    end
end
