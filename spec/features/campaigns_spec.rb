require 'rails_helper'

RSpec.describe 'Campaigns', type: :system do
  let!(:campaign) { create(:campaign) }
  let!(:desc_id) { "a#desc-#{campaign.id}" }

  scenario 'visiting the index page' do
    visit campaigns_path
    expect(page).to have_content('Campaigns')
    expect(page).to have_content(campaign.humanized_title)
  end

  scenario 'visiting the show page' do
    visit campaigns_path
    find(desc_id).click
    expect(page).to have_content(campaign.humanized_title)
    expect(page).to have_content(campaign.description)
  end
end
