module ApplicationHelper
  include Pagy::Frontend

  def my_config() = Rails.configuration.general
  

  def style_tags
    ['application', *content_for(:styles)&.split(',')]
  end

  def active_class(path)
    'active' if current_page?(path)
  end

  def glb_models
    [
      ['PEOSH4CornerMember.glb', '/static/models/PEOSH4CornerMember.glb'],
      ['PEOSH4PPC.glb', '/static/models/PEOSH4PPC.glb'],
      ['PEOSH4Welcome.glb', '/static/models/PEOSH4Welcome.glb'],
      ['VTOL_Goodyear_Blimp_moored.glb', '/static/models/VTOL_Goodyear_Blimp_moored.glb']
    ]
  end
end
