# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Campaigns', type: :request do
  before do
    @campaign_one = create(:campaign, state: 'draft', position: 1)
    @campaign_two = create(:campaign, state: 'published', position: 2)
    @campaign_three = create(:campaign, state: 'archived', position: 3)
  end

  describe 'GET /index' do
    it 'returns campaigns in the correct order' do
      get campaigns_path
      expect(response).to have_http_status(:success)
      body = response.body
      expect(body.index(@campaign_two.humanized_title)).to be < body.index(@campaign_one.humanized_title)
      expect(body.index(@campaign_three.humanized_title)).to be > body.index(@campaign_two.humanized_title)
    end
  end

  describe 'GET /show' do
    let(:campaign) { @campaign_one }
    it 'returns a successful response' do
      get campaign_path(campaign)
      expect(response).to have_http_status(:success)
    end

    it 'loads the correct campaign into @campaign' do
      get campaign_path(campaign)
      expect(response.body).to include(campaign.humanized_state)
    end

    context 'with requested format' do
      it 'responds to HTML format' do
        get campaign_path(campaign), headers: { accept: 'text/html' }
        expect(response.content_type).to include('text/html')
      end

      it 'responds to Turbo Stream format' do
        get campaign_path(campaign), as: :turbo_stream
        expect(response.body).to include('turbo-frame')
      end
    end
  end
end
