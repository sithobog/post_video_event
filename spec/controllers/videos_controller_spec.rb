require 'rails_helper'

RSpec.describe VideosController, type: :controller do

  describe "GET #index" do
    it "renders the :index view" do
      get :index
      expect(response).to render_template(:index)
    end

    it "populates an array of videos" do
      first_video  = FactoryGirl.create(:video, title: 'Hola')
      second_video = FactoryGirl.create(:video, title: 'Wola')
      get :index
      expect(assigns(:videos)).to match_array([first_video, second_video])
    end
  end

  describe "GET #show" do
    it "renders the :show template" do
      video = FactoryGirl.create(:video)
      get :show, id: video
      expect(response).to render_template(:show)
    end

    it "assigns the requested video to @video" do
      video = FactoryGirl.create(:video)
      get :show, id: video
      expect(assigns(:video)).to eq video
    end
  end

  describe "GET #new" do
    it "renders the :new template" do
      video = FactoryGirl.create(:video)
      get :new, id: video
      expect(response).to render_template(:new)
    end

    it "assigns a new Video to @video" do
      get :new
      expect(assigns(:video)).to be_a_new(Video)
    end
  end

  describe "GET #edit" do
    it "renders the :edit template" do
      video = FactoryGirl.create(:video)
      get :edit, id: video
      expect(response).to render_template(:edit)
    end

    it "assigns the requested video to @video" do
      video = FactoryGirl.create(:video)
      get :edit, id: video
      expect(assigns(:video)).to eq video
    end
  end

  describe "POST #create" do
    context "with valid attributes" do
      it "saves the new video in the database" do
        expect {
          post :create, video: FactoryGirl.attributes_for(:video)
        }.to change(Video, :count).by(1)
      end

      it "redirects to video#show" do
        post :create, video: FactoryGirl.attributes_for(:video)
        expect(response).to redirect_to video_path(assigns[:video])
      end
    end

    context "with invalid attributes" do
      it "does not save the new video in the database" do
        expect {
          post :create, video: FactoryGirl.attributes_for(:invalid_video)
        }.to_not change(Video, :count)
      end

      it "re-renders the :new template" do
        post :create, video: FactoryGirl.attributes_for(:invalid_video)
        expect(response).to render_template :new
      end
    end
  end

  describe "PATCH #update" do
    before :each do
      @video = FactoryGirl.create(:video,
                                 title: 'Phew phew',
                                 description: 'Some description')
    end

    context "valid attributes" do
      it "locates the requested @video" do
        patch :update, id: @video, video: FactoryGirl.attributes_for(:video)
        expect(assigns(:video)).to eq(@video)
      end

      it "changes @video's attributes" do
        patch :update, id: @video,
          video: FactoryGirl.attributes_for(:video,
            title: 'Edited title',
            description: 'Edited description')
        @video.reload
        expect(@video.title).to eq('Edited title')
        expect(@video.description).to eq('Edited description')
      end

      it "redirects to the updated video" do
        patch :update, id: @video, video: FactoryGirl.attributes_for(:video)
        expect(response).to redirect_to @video
      end
    end

    context "with invalid attributes" do
      it "does not change the @video's attributes" do
        patch :update, id: @video,
          video: FactoryGirl.attributes_for(:video,
            title: 'Updated', description: nil)
        @video.reload
        expect(@video.title).to_not eq('Updated')
        expect(@video.description).to eq('Some description')
      end

      it "re-renders the edit template" do
        patch :update, id: @video,
          video: FactoryGirl.attributes_for(:invalid_video)
        expect(response).to render_template 'edit'
      end
    end
  end

  describe "DELETE #destroy" do
    before :each do
      @video = FactoryGirl.create(:video)
    end

    it "deletes the video" do
      expect {
        delete :destroy, id: @video
      }.to change(Video, :count).by(-1)
    end

    it "redirects to videos#index" do
      delete :destroy, id: @video
      expect(response).to redirect_to videos_path
    end
  end

end
