module CampaignsHelper
  def state_badge(item)
    return '' unless item.state.present?

    color_state_hash = { 'draft' => 'orange', 'published' => 'green', 'archived' => 'gray' }
    badge(color_state_hash[item.state])
  end
end
