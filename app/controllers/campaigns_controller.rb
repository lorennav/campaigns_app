# frozen_string_literal: true

class CampaignsController < ApplicationController
  def index
    @campaigns = Campaign.ordered_by_state_and_position
  end

  def show
    @campaign = Campaign.find(params[:id])
    respond_to do |format|
      format.html
      format.turbo_stream
    end
  end
end
