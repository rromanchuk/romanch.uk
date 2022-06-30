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
    ]
  end
end

# WATl.glb
# BaronPilot.glb
# Blu.glb
# Bose.glb
# BoseWhite.glb
# Bro.glb
# BrunoBlack.glb
# BrunoWhite.glb
# ChasinTailwinds.glb
# Chops.glb
# EAA.glb
# Emily.glb
# FlightOutfitters.glb
# FlyingEyes.glb
# FlyingEyesBlack.glb
# FlyingMidwest.glb
# FSA.glb
# Gleim.glb
# HCA.glb
# JustPlaneSilly.glb
# King.glb
# NAFI.glb
# NAVl.glb
# OpposingBases.glb
# Pivot.glb
# PivotBlack.glb
# RSG.glb
# Sportys.glb
# SQKR.glb
# SQKRWhite.glb
# TFP.glb
# TFPWhite.glb
# ThrustMaster.glb