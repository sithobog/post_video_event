require 'rails_helper'

RSpec.describe PostsController, type: :controller do

  describe "GET #index" do
    it "renders the :index view" do
      get :index
      expect(response).to render_template(:index)
    end

    it "populates an array of posts" do
      first_post  = FactoryGirl.create(:post, title: 'Hola')
      second_post = FactoryGirl.create(:post, title: 'Wola')
      get :index
      expect(assigns(:posts)).to match_array([first_post, second_post])
    end
  end

  describe "GET #show" do
    it "renders the :show template" do
      post = FactoryGirl.create(:post)
      get :show, id: post
      expect(response).to render_template(:show)
    end

    it "assigns the requested post to @post" do
      post = FactoryGirl.create(:post)
      get :show, id: post
      expect(assigns(:post)).to eq post
    end
  end

  describe "GET #new" do
    it "renders the :new template" do
      post = FactoryGirl.create(:post)
      get :new, id: post
      expect(response).to render_template(:new)
    end

    it "assigns a new Post to @post" do
      get :new
      expect(assigns(:post)).to be_a_new(Post)
    end
  end

  describe "GET #edit" do
    it "renders the :edit template" do
      post = FactoryGirl.create(:post)
      get :edit, id: post
      expect(response).to render_template(:edit)
    end

    it "assigns the requested post to @post" do
      post = FactoryGirl.create(:post)
      get :edit, id: post
      expect(assigns(:post)).to eq post
    end
  end

  describe "POST #create" do
    context "with valid attributes" do
      it "saves the new post in the database" do
        expect {
          post :create, post: FactoryGirl.attributes_for(:post)
        }.to change(Post, :count).by(1)
      end

      it "redirects to post#show" do
        post :create, post: FactoryGirl.attributes_for(:post)
        expect(response).to redirect_to post_path(assigns[:post])
      end
    end

    context "with invalid attributes" do
      it "does not save the new post in the database" do
        expect {
          post :create, post: FactoryGirl.attributes_for(:invalid_post)
        }.to_not change(Post, :count)
      end

      it "re-renders the :new template" do
        post :create, post: FactoryGirl.attributes_for(:invalid_post)
        expect(response).to render_template :new
      end
    end
  end

  describe "PATCH #update" do
    before :each do
      @post = FactoryGirl.create(:post,
                                 title: 'Phew phew',
                                 content: 'Some content')
    end

    context "valid attributes" do
      it "locates the requested @post" do
        patch :update, id: @post, post: FactoryGirl.attributes_for(:post)
        expect(assigns(:post)).to eq(@post)
      end

      it "changes @post's attributes" do
        patch :update, id: @post,
          post: FactoryGirl.attributes_for(:post,
            title: 'Edited title',
            content: 'Edited content')
        @post.reload
        expect(@post.title).to eq('Edited title')
        expect(@post.content).to eq('Edited content')
      end

      it "redirects to the updated post" do
        patch :update, id: @post, post: FactoryGirl.attributes_for(:post)
        expect(response).to redirect_to @post
      end
    end

    context "with invalid attributes" do
      it "does not change the @post's attributes" do
        patch :update, id: @post,
          post: FactoryGirl.attributes_for(:post,
            title: 'Updated', content: nil)
        @post.reload
        expect(@post.title).to_not eq('Updated')
        expect(@post.content).to eq('Some content')
      end

      it "re-renders the edit template" do
        patch :update, id: @post,
          post: FactoryGirl.attributes_for(:invalid_post)
        expect(response).to render_template 'edit'
      end
    end
  end

  describe "DELETE #destroy" do
    before :each do
      @post = FactoryGirl.create(:post)
    end

    it "deletes the post" do
      expect {
        delete :destroy, id: @post
      }.to change(Post, :count).by(-1)
    end

    it "redirects to posts#index" do
      delete :destroy, id: @post
      expect(response).to redirect_to posts_path
    end
  end

end
