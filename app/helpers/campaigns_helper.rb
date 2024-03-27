module CampaignsHelper
  def state_badge(item)
    return '' unless item.state.present?

    color_state_hash = { orange: item.draft?, green: item.published?, gray: item.archived? }
    bg_color = class_names('bg-', color_state_hash, '-100').delete(' ')
    text_color = class_names('text-', color_state_hash, '-600').delete(' ')
    "#{bg_color} px-[0.65em] pb-[0.25em] pt-[0.35em] text-center
      align-baseline text-[0.75em] font-bold leading-none #{text_color}"
  end
end
