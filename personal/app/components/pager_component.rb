# frozen_string_literal: true

class PagerComponent < ViewComponent::Base
  attr_reader :next_path, :prev_path, :dr_pagy

  def initialize(dr_pagy, previous_path:, next_path:)
    @dr_pagy = dr_pagy
    @prev_path = previous_path
    @next_path = next_path
  end
end
