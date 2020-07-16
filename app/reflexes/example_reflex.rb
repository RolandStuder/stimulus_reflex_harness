# frozen_string_literal: true

class ExampleReflex < ApplicationReflex
  include ActionView::Helpers::TagHelper
  delegate :uuid, to: :connection

  def page_morph
    #do nothing
  end

  def partial_morph
    morph "#morph-this", 'Partial morph <button data-reflex="click->Example#partial_morph">Partial Morph</button>'
  end

  def delayed_partial_morph
    morph "#morph-this", 'Partial morph <button data-action="click->example#delayedPartialMorph">Delayed Partial Morph</button>'
  end

  def partial_morph_with_sleep
    sleep 1
    morph "#morph-this", 'Partial morph <button data-reflex="click->Example#partial_morph_with_sleep">Partial Morph with sleep</button>'
  end

  def morph_child
    morph "#a-child", "Morphed child"
  end

  def partial_morph_including_parent
    morph "#morph-this", content_tag(:div, 'partial morph with parent <button data-reflex="click->Example#partial_morph_including_parent">Partial Morph, including parent</button>'.html_safe)
  end
end
