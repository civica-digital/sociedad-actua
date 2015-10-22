describe SessionsController, :omniauth do

  before do
    request.env['omniauth.auth'] = auth_mock
  end

  describe "#create" do

    xit "creates a user" do
      expect {post :create, provider: :twitter}.to change{ User.count }.by(1)
    end

    xit "creates a session" do
      expect(session[:user_id]).to be_nil
      post :create, provider: :twitter
      expect(session[:user_id]).not_to be_nil
    end

    xit "redirects to the home page" do
      post :create, provider: :twitter
      expect(response).to redirect_to root_url
    end

  end

  describe "#destroy" do

    before do
      post :create, provider: :twitter
    end

    xit "resets the session" do
      expect(session[:user_id]).not_to be_nil
      delete :destroy
      expect(session[:user_id]).to be_nil
    end

    xit "redirects to the home page" do
      delete :destroy
      expect(response).to redirect_to root_url
    end

  end

end
