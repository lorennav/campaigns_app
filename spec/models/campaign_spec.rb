# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Campaign, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:state) }
    it { should validate_presence_of(:publication_date) }
    it { should validate_presence_of(:position) }
  end

  describe 'enums' do
    it { should define_enum_for(:state).with_values(draft: 0, published: 1, archived: 2) }
  end

  describe 'scopes' do
    describe '.states_keys' do
      subject { described_class.states_keys }

      it { is_expected.to eq(%w[draft published archived]) }
    end

    describe '.ordered_by_state_and_position' do
      let!(:campaign_1) { create(:campaign, state: :draft, position: 1) }
      let!(:campaign_2) { create(:campaign, state: :published, position: 2) }
      let!(:campaign_3) { create(:campaign, state: :archived, position: 3) }

      subject { described_class.ordered_by_state_and_position }

      it { is_expected.to eq([campaign_2, campaign_1, campaign_3]) }
    end
  end

  describe 'factories' do
    describe 'campaign' do
      subject { build(:campaign) }

      it { is_expected.to be_valid }
    end
  end
end
