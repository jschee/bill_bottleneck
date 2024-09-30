# frozen_string_literal: true

# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[8.0].define(version: 20_240_929_191_244) do
  # These are extensions that must be enabled in order to support this database
  enable_extension 'pg_catalog.plpgsql'

  create_table 'bill_posts', force: :cascade do |t|
    t.string 'title'
    t.text 'description'
    t.string 'url'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'solid_cache_entries', force: :cascade do |t|
    t.binary 'key', null: false
    t.binary 'value', null: false
    t.datetime 'created_at', null: false
    t.bigint 'key_hash', null: false
    t.integer 'byte_size', null: false
    t.index ['byte_size'], name: 'index_solid_cache_entries_on_byte_size'
    t.index %w[key_hash byte_size], name: 'index_solid_cache_entries_on_key_hash_and_byte_size'
    t.index ['key_hash'], name: 'index_solid_cache_entries_on_key_hash', unique: true
  end

  create_table 'taggings', force: :cascade do |t|
    t.bigint 'tag_id', null: false
    t.string 'taggable_type', null: false
    t.bigint 'taggable_id', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['tag_id'], name: 'index_taggings_on_tag_id'
    t.index %w[taggable_type taggable_id], name: 'index_taggings_on_taggable'
  end

  create_table 'tags', force: :cascade do |t|
    t.string 'name', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['name'], name: 'index_tags_on_name'
  end

  create_table 'votes', force: :cascade do |t|
    t.bigint 'bill_post_id', null: false
    t.integer 'vote_type'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['bill_post_id'], name: 'index_votes_on_bill_post_id'
  end

  add_foreign_key 'taggings', 'tags'
  add_foreign_key 'votes', 'bill_posts'
end
