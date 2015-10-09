require 'rails_helper'

RSpec.describe EventsController, type: :controller do

	describe "GET #index" do
    it "renders the :index view" do
      get :index
      expect(response).to render_template(:index)
    end

    it "populates an array of events" do
      first_event  = FactoryGirl.create(:event, title: 'Hola')
      second_event = FactoryGirl.create(:event, title: 'Wola')
      get :index
      expect(assigns(:events)).to match_array([first_event, second_event])
    end
  end

  describe "GET #show" do
    it "renders the :show template" do
      event = FactoryGirl.create(:event)
      get :show, id: event
      expect(response).to render_template(:show)
    end

    it "assigns the requested event to @event" do
      event = FactoryGirl.create(:event)
      get :show, id: event
      expect(assigns(:event)).to eq event
    end
  end

  describe "GET #new" do
    it "renders the :new template" do
      event = FactoryGirl.create(:event)
      get :new, id: event
      expect(response).to render_template(:new)
    end

    it "assigns a new Event to @event" do
      get :new
      expect(assigns(:event)).to be_a_new(Event)
    end
  end

  describe "GET #edit" do
    it "renders the :edit template" do
      event = FactoryGirl.create(:event)
      get :edit, id: event
      expect(response).to render_template(:edit)
    end

    it "assigns the requested event to @event" do
      event = FactoryGirl.create(:event)
      get :edit, id: event
      expect(assigns(:event)).to eq event
    end
  end

  describe "POST #create" do
    context "with valid attributes" do
      it "saves the new event in the database" do
        expect {
          post :create, event: FactoryGirl.attributes_for(:event)
        }.to change(Event, :count).by(1)
      end

      it "redirects to event#show" do
        post :create, event: FactoryGirl.attributes_for(:event)
        expect(response).to redirect_to event_path(assigns[:event])
      end
    end

    context "with invalid attributes" do
      it "does not save the new event in the database" do
        expect {
          post :create, event: FactoryGirl.attributes_for(:invalid_event)
        }.to_not change(Event, :count)
      end

      it "re-renders the :new template" do
        post :create, event: FactoryGirl.attributes_for(:invalid_event)
        expect(response).to render_template :new
      end
    end
  end

  describe "PATCH #update" do
    before :each do
      @event = FactoryGirl.create(:event,
                                 title: 'Phew phew',
                                 address: 'Some address')
    end

    context "valid attributes" do
      it "locates the requested @event" do
        patch :update, id: @event, event: FactoryGirl.attributes_for(:event)
        expect(assigns(:event)).to eq(@event)
      end

      it "changes @event's attributes" do
        patch :update, id: @event,
          event: FactoryGirl.attributes_for(:event,
            title: 'Edited title',
            address: 'Edited address')
        @event.reload
        expect(@event.title).to eq('Edited title')
        expect(@event.address).to eq('Edited address')
      end

      it "redirects to the updated event" do
        patch :update, id: @event, event: FactoryGirl.attributes_for(:event)
        expect(response).to redirect_to @event
      end
    end

    context "with invalid attributes" do
      it "does not change the @event's attributes" do
        patch :update, id: @event,
          event: FactoryGirl.attributes_for(:event,
            title: 'Updated', address: nil)
        @event.reload
        expect(@event.title).to_not eq('Updated')
        expect(@event.address).to eq('Some address')
      end

      it "re-renders the edit template" do
        patch :update, id: @event,
          event: FactoryGirl.attributes_for(:invalid_event)
        expect(response).to render_template 'edit'
      end
    end
  end

  describe "DELETE #destroy" do
    before :each do
      @event = FactoryGirl.create(:event)
    end

    it "deletes the event" do
      expect {
        delete :destroy, id: @event
      }.to change(Event, :count).by(-1)
    end

    it "redirects to events#index" do
      delete :destroy, id: @event
      expect(response).to redirect_to events_path
    end
  end

end
