class ResetPaperclip < ActiveRecord::Migration[5.1]
  def change
    remove_attachment :items, :image
  end
end
