# frozen_string_literal: true

class DeviseCreateUsers < ActiveRecord::Migration[5.2]
  def change
    enable_extension "citext"
    enable_extension "pgcrypto"
    enable_extension "plpgsql"

    create_table "users", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
      t.citext :email, null: false
      t.string :encrypted_password, null: false
      t.datetime :confirmed_at
      t.string :jti, null: false
      t.timestamps null: false
    end

    add_index :users, :email, unique: true
    add_index :users, :jti, unique: true
  end
end
