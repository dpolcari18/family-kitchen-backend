require 'rails_helper'

RSpec.describe 'GraphQL', type: :request do

    let(:user) { User.create(auth_id: 'fakeid')}
    
    let(:family) { Family.create(name: 'New Family') }
    let(:user_family) { UserFamily.create(user_id: user.id, family_id: family.id, head: true) }

    let!(:recipe) {Recipe.create(name: 'Ramen', prep_time: 60, cuisine_type: 'Asian', family_id: family.id)}
    
    describe 'getUserInfo Query' do
        let(:variable) { {id: user.id} }
        let(:query_string) { 'query getUserInfo($id: Int!) { user (id: $id) { id, families { id, name } } }' }
        let(:response) { FamilyKitchenBackendSchema.execute(query_string, variables: variable).to_h }
        
        it 'returns a hash with a user key given a proper user id' do
            expect(response['data']).to have_key('user')
        end

        it 'returns an error with message when not provided a valid id' do
            variable[:id] = 1
            expect(response['errors'][0]).to have_key('message')
        end

        it 'returns an array of families the user is a part of' do
            expect(response['data']['user']['families']).to be_an(Array) 
        end
    end

    describe 'getFamilyInfo Query' do
        let(:variable) { { id: family.id } }
        let(:query_string) { 'query getFamilyInfo($id: Int!) { family (id: $id) { id, recipes { id, name, prepTime, cuisineType, ingredients { name } } } }' }
        let(:response) { FamilyKitchenBackendSchema.execute(query_string, variables: variable).to_h }

        it 'returns a hash with a family key given a proper family id' do
            expect(response['data']).to have_key('family')
        end

        it 'returns an error with message when not provided a valid id' do
            variable[:id] = 1
            expect(response['errors'][0]).to have_key('message')
        end

        it 'returns an array of recipes the family has created' do
            expect(response['data']['family']['recipes']).to be_an(Array)
        end
    end
end
