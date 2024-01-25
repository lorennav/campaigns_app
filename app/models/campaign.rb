# frozen_string_literal: true

class Campaign < ApplicationRecord
  validates :title, :description, :state, :publication_date, :position, presence: true
  enum state: {
    draft: 0,
    published: 1,
    archived: 2
  }
  scope :states_keys, -> { states.keys }
  scope :ordered_by_state_and_position, lambda {
    order(Arel.sql('CASE state WHEN 1 THEN 1 WHEN 0 THEN 2 ELSE 3 END, position DESC'))
  }

  def humanized_title
    title.humanize
  end

  def humanized_state
    state.humanize
  end
end
