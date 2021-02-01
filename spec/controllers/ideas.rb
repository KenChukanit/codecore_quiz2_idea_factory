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
            it 'set an instance variable with a new project instance' do
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

end
