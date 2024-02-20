# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Events', type: :request do
  include_context 'common'

  describe 'GET /index' do
    context 'with sign_in' do
      before(:each) do
        sign_in user
      end

      it 'should fetch events of logged in user' do
        VCR.use_cassette('user_events') do
          get events_path

          expect(response.status).to be(200)
        end
      end
    end

    context 'without sign_in' do
      it 'should not fetch events without user login' do
        get events_path

        expect(response.status).to be(302)
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end

  describe 'GET /new' do
    it 'should render new template' do
      sign_in user
      get new_event_path

      expect(response).to render_template(:new)
    end
  end

  describe 'GET /create' do
    context 'with sign_in' do
      before(:each) do
        sign_in user
      end

      it 'should intiate event b', vcr: true do
        VCR.use_cassette('event_email_open') do
          post events_path, params: { commit: "B" }

          expect(response.status).to be(302)
          expect(response).to redirect_to(events_path)
        end
      end

      it 'should intiate event a', vcr: true do
        VCR.use_cassette('event_email_other') do
          post events_path, params: { commit: "A" }

          expect(response.status).to be(302)
          expect(response).to redirect_to(events_path)
        end
      end
    end
  end
end
