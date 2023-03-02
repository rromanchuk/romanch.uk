module ApplicationHelper
  include Pagy::Frontend

  def my_config = Rails.configuration.general
  def iid = cookies[:iid].presence

  def style_tags
    ['application', *content_for(:styles)&.split(',')]
  end

  def active_class(path)
    'active' if current_page?(path)
  end
  
  def tei_replace(str)
    return unless str
    
    result = str.dup
  
    Tds::Constants::TEI_DICTIONARY.each do |key, value|
      result.gsub!(/\b#{Regexp.quote(key)}\b/, value)
    end
  
    result
  end
  
  def breadcrumb_json_ld(crumbs)
    Jbuilder.new do |json|
      json.ignore_nil!
      json.set! :@context, 'http://schema.org/'
      json.set! :@type, 'BreadcrumbList'
      json.itemListElement crumbs do |crumb|
        json.set! "@type": 'ListItem'
        json.name crumb.name
        json.item crumb.url
        json.position crumb.postion(crumbs)
      end
    end
  end

  def glb_models
    [
      ['PEOSH4CornerMember.glb', '/static/models/PEOSH4CornerMember.glb'],
      ['PEOSH4PPC.glb', '/static/models/PEOSH4PPC.glb'],
      ['PEOSH4Welcome.glb', '/static/models/PEOSH4Welcome.glb'],
      ['VTOL_Goodyear_Blimp_moored.glb', '/static/models/VTOL_Goodyear_Blimp_moored.glb'],
      ['CurvedBanners/WATl.glb', '/static/models/CurvedBanners/WATl.glb'],
      ['CurvedBanners/BaronPilot.glb', '/static/models/CurvedBanners/BaronPilot.glb'],
      ['CurvedBanners/Blu.glb', '/static/models/CurvedBanners/Blu.glb'],
      ['CurvedBanners/Bose.glb', '/static/models/CurvedBanners/Bose.glb'],
      ['CurvedBanners/BoseWhite.glb', '/static/models/CurvedBanners/BoseWhite.glb'],
      ['CurvedBanners/Bro.glb', '/static/models/CurvedBanners/Bro.glb'],
      ['CurvedBanners/BrunoBlack.glb', '/static/models/CurvedBanners/BrunoBlack.glb'],
      ['CurvedBanners/ChasinTailwinds.glb', '/static/models/CurvedBanners/ChasinTailwinds.glb'],
      ['CurvedBanners/Chops.glb', '/static/models/CurvedBanners/Chops.glb'],
      ['CurvedBanners/EAA.glb', '/static/models/CurvedBanners/EAA.glb'],
      ['CurvedBanners/Emily.glb', '/static/models/CurvedBanners/Emily.glb'],
      ['CurvedBanners/FlightOutfitters.glb', '/static/models/CurvedBanners/FlightOutfitters.glb'],
      ['CurvedBanners/FlyingEyes.glb', '/static/models/CurvedBanners/FlyingEyes.glb'],
      ['CurvedBanners/FlyingMidwest.glb', '/static/models/CurvedBanners/FlyingMidwest.glb'],
      ['CurvedBanners/FSA.glb', '/static/models/CurvedBanners/FSA.glb'],
      ['CurvedBanners/Gleim.glb', '/static/models/CurvedBanners/Gleim.glb'],
      ['CurvedBanners/HCA.glb', '/static/models/CurvedBanners/HCA.glb'],
      ['CurvedBanners/JustPlaneSilly.glb', '/static/models/CurvedBanners/JustPlaneSilly.glb'],
      ['CurvedBanners/King.glb', '/static/models/CurvedBanners/King.glb'],
      ['CurvedBanners/NAFI.glb', '/static/models/CurvedBanners/NAFI.glb'],
      ['CurvedBanners/Nike.glb', '/static/models/CurvedBanners/Nike.glb'],
      ['CurvedBanners/NAVI.glb', '/static/models/CurvedBanners/NAVI.glb'],
      ['CurvedBanners/OpposingBases.glb', '/static/models/CurvedBanners/OpposingBases.glb'],
      ['CurvedBanners/Pivot.glb', '/static/models/CurvedBanners/Pivot.glb'],
      ['CurvedBanners/RSG.glb', '/static/models/CurvedBanners/RSG.glb'],
      ['CurvedBanners/Sportys.glb', '/static/models/CurvedBanners/Sportys.glb'],
      ['CurvedBanners/SQKR.glb', '/static/models/CurvedBanners/SQKR.glb'],
      ['CurvedBanners/TFP.glb', '/static/models/CurvedBanners/TFP.glb'],
      ['CurvedBanners/ThrustMaster.glb', '/static/models/CurvedBanners/ThrustMaster.glb']
    ]
  end
end
