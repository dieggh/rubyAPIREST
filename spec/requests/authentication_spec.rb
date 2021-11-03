require 'rails_helper'

describe 'Authentication', type: :request do
    describe "POST /authenticate" do
        it 'authenticates the client' do
            post '/api/v1/authenticate', params: { username: 'BookSeller99', password: 'root'}
            expect(response).to have_http_status(:created)
            expect(response_body).to eq({
                'token' => '123'
            })  
        end

        it "returns error when username is missing" do
            post '/api/v1/authenticate', params: { password: 'root'}
            expect(response).to have_http_status(:unprocessable_entity);             
        end

        it "returns error when password is missing" do
            post '/api/v1/authenticate', params: { username: 'BookSeller99'}
            expect(response).to have_http_status(:unprocessable_entity);  
        end
        
        
    end
    
end