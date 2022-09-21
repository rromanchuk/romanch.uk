class RemoveDefaultNotNull < ActiveRecord::Migration[7.0]
  def change
    change_column_null :wx_pireps, :sky_condition, true
    change_column_default :wx_pireps, :sky_condition, nil
    change_column_null :wx_pireps, :turbulence_condition, true
    change_column_default :wx_pireps, :turbulence_condition, nil
    change_column_null :wx_pireps, :icing_condition, true
    change_column_default :wx_pireps, :icing_condition, nil
  end
end
