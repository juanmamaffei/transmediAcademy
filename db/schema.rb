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

ActiveRecord::Schema.define(version: 20_210_222_054_444) do
  # These are extensions that must be enabled in order to support this database
  enable_extension 'plpgsql'

  create_table 'action_text_rich_texts', force: :cascade do |t|
    t.string 'name', null: false
    t.text 'body'
    t.string 'record_type', null: false
    t.bigint 'record_id', null: false
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index %w[record_type record_id name], name: 'index_action_text_rich_texts_uniqueness', unique: true
  end

  create_table 'active_admin_comments', force: :cascade do |t|
    t.string 'namespace'
    t.text 'body'
    t.string 'resource_type'
    t.bigint 'resource_id'
    t.string 'author_type'
    t.bigint 'author_id'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index %w[author_type author_id], name: 'index_active_admin_comments_on_author'
    t.index ['namespace'], name: 'index_active_admin_comments_on_namespace'
    t.index %w[resource_type resource_id], name: 'index_active_admin_comments_on_resource'
  end

  create_table 'active_storage_attachments', force: :cascade do |t|
    t.string 'name', null: false
    t.string 'record_type', null: false
    t.bigint 'record_id', null: false
    t.bigint 'blob_id', null: false
    t.datetime 'created_at', null: false
    t.index ['blob_id'], name: 'index_active_storage_attachments_on_blob_id'
    t.index %w[record_type record_id name blob_id], name: 'index_active_storage_attachments_uniqueness',
                                                    unique: true
  end

  create_table 'active_storage_blobs', force: :cascade do |t|
    t.string 'key', null: false
    t.string 'filename', null: false
    t.string 'content_type'
    t.text 'metadata'
    t.string 'service_name', null: false
    t.bigint 'byte_size', null: false
    t.string 'checksum', null: false
    t.datetime 'created_at', null: false
    t.index ['key'], name: 'index_active_storage_blobs_on_key', unique: true
  end

  create_table 'active_storage_variant_records', force: :cascade do |t|
    t.bigint 'blob_id', null: false
    t.string 'variation_digest', null: false
    t.index %w[blob_id variation_digest], name: 'index_active_storage_variant_records_uniqueness', unique: true
  end

  create_table 'admin_users', force: :cascade do |t|
    t.string 'email', default: '', null: false
    t.string 'encrypted_password', default: '', null: false
    t.string 'reset_password_token'
    t.datetime 'reset_password_sent_at'
    t.datetime 'remember_created_at'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['email'], name: 'index_admin_users_on_email', unique: true
    t.index ['reset_password_token'], name: 'index_admin_users_on_reset_password_token', unique: true
  end

  create_table 'chapters', force: :cascade do |t|
    t.string 'name'
    t.string 'description'
    t.integer 'goals', default: [], array: true
    t.bigint 'course_id', null: false
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.integer 'sequence'
    t.string 'aasm_state'
    t.index ['course_id'], name: 'index_chapters_on_course_id'
  end

  create_table 'contents', force: :cascade do |t|
    t.bigint 'course_id', null: false
    t.bigint 'chapter_id', null: false
    t.string 'name'
    t.text 'richContent'
    t.integer 'priority'
    t.integer 'testId'
    t.integer 'minimumScore'
    t.string 'goals', default: [], array: true
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.integer 'typeOfContent'
    t.integer 'sequence'
    t.text 'embed'
    t.integer 'requirements'
    t.string 'aasm_state'
    t.index ['chapter_id'], name: 'index_contents_on_chapter_id'
    t.index ['course_id'], name: 'index_contents_on_course_id'
  end

  create_table 'courses', force: :cascade do |t|
    t.string 'name'
    t.string 'description'
    t.string 'category'
    t.integer 'price'
    t.string 'goals'
    t.integer 'duration'
    t.text 'evaluation'
    t.boolean 'visibility'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.integer 'chapters', default: [], array: true
    t.string 'aasm_state'
  end

  create_table 'leads', force: :cascade do |t|
    t.string 'user'
    t.string 'status'
    t.string 'course'
    t.string 'name'
    t.string 'email'
    t.string 'info'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
  end

  create_table 'matriculations', force: :cascade do |t|
    t.bigint 'user_id', null: false
    t.bigint 'course_id', null: false
    t.integer 'permissions'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['course_id'], name: 'index_matriculations_on_course_id'
    t.index ['user_id'], name: 'index_matriculations_on_user_id'
  end

  create_table 'points', force: :cascade do |t|
    t.bigint 'user_id', null: false
    t.bigint 'content_id', null: false
    t.bigint 'test_id', null: false
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.integer 'score'
    t.index ['content_id'], name: 'index_points_on_content_id'
    t.index ['test_id'], name: 'index_points_on_test_id'
    t.index ['user_id'], name: 'index_points_on_user_id'
  end

  create_table 'tests', force: :cascade do |t|
    t.string 'question'
    t.string 'a1'
    t.string 'a2'
    t.string 'a3'
    t.string 'a4'
    t.integer 'correct'
    t.bigint 'content_id', null: false
    t.integer 'score'
    t.string 'difficulty'
    t.string 'state'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['content_id'], name: 'index_tests_on_content_id'
  end

  create_table 'user_contents', force: :cascade do |t|
    t.text 'markdownContent'
    t.string 'sticked'
    t.string 'claps'
    t.string 'responseTo'
    t.bigint 'user_id', null: false
    t.bigint 'content_id', null: false
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.integer 'content_type'
    t.string 'aasm_state'
    t.index ['content_id'], name: 'index_user_contents_on_content_id'
    t.index ['user_id'], name: 'index_user_contents_on_user_id'
  end

  create_table 'users', force: :cascade do |t|
    t.string 'email', default: '', null: false
    t.string 'encrypted_password', default: '', null: false
    t.string 'reset_password_token'
    t.datetime 'reset_password_sent_at'
    t.datetime 'remember_created_at'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.string 'name'
    t.string 'about'
    t.integer 'permissions'
    t.index ['email'], name: 'index_users_on_email', unique: true
    t.index ['reset_password_token'], name: 'index_users_on_reset_password_token', unique: true
  end

  create_table 'votes', force: :cascade do |t|
    t.string 'votable_type'
    t.bigint 'votable_id'
    t.string 'voter_type'
    t.bigint 'voter_id'
    t.boolean 'vote_flag'
    t.string 'vote_scope'
    t.integer 'vote_weight'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index %w[votable_id votable_type vote_scope],
            name: 'index_votes_on_votable_id_and_votable_type_and_vote_scope'
    t.index %w[votable_type votable_id], name: 'index_votes_on_votable_type_and_votable_id'
    t.index %w[voter_id voter_type vote_scope], name: 'index_votes_on_voter_id_and_voter_type_and_vote_scope'
    t.index %w[voter_type voter_id], name: 'index_votes_on_voter_type_and_voter_id'
  end

  add_foreign_key 'active_storage_attachments', 'active_storage_blobs', column: 'blob_id'
  add_foreign_key 'active_storage_variant_records', 'active_storage_blobs', column: 'blob_id'
  add_foreign_key 'chapters', 'courses'
  add_foreign_key 'contents', 'chapters'
  add_foreign_key 'contents', 'courses'
  add_foreign_key 'matriculations', 'courses'
  add_foreign_key 'matriculations', 'users'
  add_foreign_key 'points', 'contents'
  add_foreign_key 'points', 'tests'
  add_foreign_key 'points', 'users'
  add_foreign_key 'tests', 'contents'
  add_foreign_key 'user_contents', 'contents'
  add_foreign_key 'user_contents', 'users'
end
