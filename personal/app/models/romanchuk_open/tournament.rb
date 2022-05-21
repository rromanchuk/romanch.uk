class RomanchukOpen::Tournament < ApplicationRecord
  include Sluggable
  has_many :images, as: :imageable
  
  def slug_candidates = [:title, :ocurred_on]


  def seed
    PICS_1985.each_with_index do |key, idx|
      Image.create!(key:, title: "1st Annual 1985 #{idx}", imageable: self, tags_as_string: "1985")
    end
  end

  PICS_1985 = [
    '/static/romanchukopen/1985_1.jpg',
    '/static/romanchukopen/1985_2.jpg',
    '/static/romanchukopen/1985_3.jpg',
    '/static/romanchukopen/1985_4.jpg',
    '/static/romanchukopen/1985_5.jpg',
    '/static/romanchukopen/1985_6.jpg',
    '/static/romanchukopen/1985_7.jpg',
    '/static/romanchukopen/1985_8.jpg',
    '/static/romanchukopen/1985_9.jpg',
    '/static/romanchukopen/1985_10.jpg',
    '/static/romanchukopen/1985_11.jpg',
    '/static/romanchukopen/1985_12.jpg',
    '/static/romanchukopen/1985_13.jpg',
    '/static/romanchukopen/1985_14.jpg',
    '/static/romanchukopen/1985_15.jpg',
    '/static/romanchukopen/1985_16.jpg'
  ]

  PICS_1986 = [
    '/static/romanchukopen/1986_1.jpg',
    '/static/romanchukopen/1986_2.jpg'
  ]

  PICS_1987 = [
    '/static/romanchukopen/1987_1.jpg',
    '/static/romanchukopen/1987_2.jpg'
  ]

  PICS_1988 = [
    '/static/romanchukopen/1988_1.jpg',
    '/static/romanchukopen/1988_2.jpg'
  ]

  PICS_1989 = [
    '/static/romanchukopen/1988_1.jpg',
    '/static/romanchukopen/1988_2.jpg'
  ]

  PICS_1990 = [
    '/static/romanchukopen/1988_1.jpg',
    '/static/romanchukopen/1988_2.jpg'
  ]
  PICS_1991 = [
    '/static/romanchukopen/1988_1.jpg',
    '/static/romanchukopen/1988_2.jpg'
  ]
  PICS_1992 = [
    '/static/romanchukopen/1988_1.jpg',
    '/static/romanchukopen/1988_2.jpg'
  ]
  PICS_1993 = [
    '/static/romanchukopen/1988_1.jpg',
    '/static/romanchukopen/1988_2.jpg'
  ]

  
end
