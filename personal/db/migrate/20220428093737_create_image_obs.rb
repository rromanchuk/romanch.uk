class CreateImageObs < ActiveRecord::Migration[7.0]
  def change
    Image.create(key: 'eastereggs/sedona.jpeg')
    Image.create(key: 'eastereggs/92n2.jpeg')
  end
end
