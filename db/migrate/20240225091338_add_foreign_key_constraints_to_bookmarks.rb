class AddForeignKeyConstraintsToBookmarks < ActiveRecord::Migration[6.0]
  def change
    # Assurez-vous de supprimer d'abord les clés étrangères existantes si elles ont été ajoutées précédemment
    remove_foreign_key :bookmarks, :movies
    remove_foreign_key :bookmarks, :lists

    add_foreign_key :bookmarks, :movies, on_delete: :restrict
    add_foreign_key :bookmarks, :lists, on_delete: :restrict
  end
end
