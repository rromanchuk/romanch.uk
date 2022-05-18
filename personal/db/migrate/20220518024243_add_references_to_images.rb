class AddReferencesToImages < ActiveRecord::Migration[7.0]
  def change
    add_reference :images, :post, index: true, type: :uuid
    add_reference :videos, :post, index: true, type: :uuid
  end
end
