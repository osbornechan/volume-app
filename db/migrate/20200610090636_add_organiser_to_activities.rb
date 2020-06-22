class AddOrganiserToActivities < ActiveRecord::Migration[6.0]
  def change
    add_reference :activities, :organiser, null: false, foreign_key: true
  end
end
