require 'rails_helper'
require 'spec_helper'

RSpec.describe IdeasController, type: :controller do
    describe '#new' do
        # context 'User Signed in' do
        #     before do
        #         session[:user_id] = FactoryBot.create(:user)
        #     end
            it 'renders new template' do
                get :new
                expect(response).to render_template(:new)
            end
            it 'set an instance variable with a new idea instance' do
                get :new
                expect(assigns(:idea)).to be_a_new(Idea)
            end
        # end
        # context 'User Not Signed in' do
        #     before do
        #         session[:user_id] = nil
        #     end
        #     it 'redirect to new session template' do
        #         get :new
        #         expect(response).to redirect_to(new_session_path)
        #     end
        # end
    end######    End of #new
    describe '#create' do
        # context 'User Signed in' do
        #     before do
        #         session[:user_id] = FactoryBot.create(:user)
        #     end
            context 'Valid Parameter' do
                def valid_request
                    post(:create, params:{idea: FactoryBot.attributes_for(:idea)})
                end
                it 'create a new idea in database' do
                    count_before = Idea.count
                    valid_request
                    count_after = Idea.count
                    expect(count_after).to(eq(count_before + 1))
                end
                it 'redirect us to show page of ideas' do
                    valid_request
                    idea = Idea.last
                    expect(response).to(redirect_to(idea_path(idea.id)))
                end
                it 'it show flash msg idea created' do
                    valid_request
                    expect(flash[:notice]).to be
                end
            end
            context 'Invalid Parameter' do
                def invalid_request
                    post(:create, params:{idea: FactoryBot.attributes_for(:idea, title: nil)})
                end
                it 'does not record in database' do
                    count_before = Idea.count
                    invalid_request
                    count_after = Idea.count
                    expect(count_after).to(eq(count_before))
                end
                it 'render new template' do
                    invalid_request
                    expect(response).to render_template(:new)
                end
            end
        # end
        # context 'User Not signed in' do
        #     def valid_request
        #         post(:create, params:{idea: FactoryBot.attributes_for(:idea)})
        #     end
        #     it 'should redirect to new session path' do
        #         valid_request
        #         expect(response).to redirect_to(new_session_path)
        #     end
        # end
    end######    End of #create

end
