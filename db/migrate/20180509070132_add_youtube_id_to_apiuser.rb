class AddYoutubeIdToApiuser < ActiveRecord::Migration[5.1]
  def change
    add_column :apiusers, :youtube_id, :string
  end
end
