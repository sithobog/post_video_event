require 'rails_helper'

RSpec.describe TagsController, type: :controller do


	describe "GET #index" do
    it "renders the :index view" do
      get :index
      expect(response).to render_template(:index)
    end

    it "populates an array of tags" do
      first_tag  = FactoryGirl.create(:tag, name: 'Hola', slug: "First slug")
      second_tag = FactoryGirl.create(:tag, name: 'Wola', slug: "Second slug")
      get :index
      expect(assigns(:tags)).to match_array([first_tag, second_tag])
    end
  end

  describe "GET #new" do
    it "renders the :new template" do
      tag = FactoryGirl.create(:tag)
      get :new, id: tag
      expect(response).to render_template(:new)
    end

    it "assigns a new Tag to @tag" do
      get :new
      expect(assigns(:tag)).to be_a_new(Tag)
    end
  end

  describe "POST #create" do
    context "with valid attributes" do
      it "saves the new tag in the database" do
        expect {
          post :create, tag: FactoryGirl.attributes_for(:tag)
        }.to change(Tag, :count).by(1)
      end

      it "redirects to tag#index" do
        post :create, tag: FactoryGirl.attributes_for(:tag)
        expect(response).to redirect_to tags_path
      end
    end

    context "with invalid attributes" do
      it "does not save the new tag in the database" do
        expect {
          post :create, tag: FactoryGirl.attributes_for(:invalid_tag)
        }.to_not change(Tag, :count)
      end

      it "re-renders the :new template" do
        post :create, tag: FactoryGirl.attributes_for(:invalid_tag)
        expect(response).to render_template :new
      end
    end
  end

  describe "DELETE #destroy" do
    before :each do
      @tag = FactoryGirl.create(:tag)
    end

    it "deletes the tag" do
      expect {
        delete :destroy, id: @tag.slug
      }.to change(Tag, :count).by(-1)
    end

    it "redirects to tag#index" do
      delete :destroy, id: @tag.slug
      expect(response).to redirect_to tags_path
    end
  end

end
