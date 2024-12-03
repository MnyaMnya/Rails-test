class CreateComments < ActiveRecord::Migration[7.1]
  def change
  create_table "articles", force: :cascade do |t|
    t.string "title"
    t.text "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "status"
    t.bigint "owner_id"
  end

  create_table "comments", force: :cascade do |t|
    t.bigint "commenter_id"
    t.text "body"
    t.bigint "article_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "status"
    t.index ["article_id"], name: "index_comments_on_article_id"
    t.unique_constraint ["commenter_id"], name: "comments_commenter_key"
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "username"
  end

  add_foreign_key "articles", "users", column: "owner_id", name: "articles_owner_id_fkey", on_update: :cascade, on_delete: :cascade
  add_foreign_key "comments", "articles"
  add_foreign_key "comments", "users", column: "commenter_id", name: "comments_commenter_id_fkey", on_update: :cascade, on_delete: :cascade
  end
end

