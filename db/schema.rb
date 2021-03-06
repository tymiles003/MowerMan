# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20150216202448) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "areas", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "number"
  end

  create_table "departments", force: true do |t|
    t.string   "name"
    t.integer  "number"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "egg_timers", force: true do |t|
    t.string   "kind"
    t.integer  "assign_time"
    t.integer  "overdue_time"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "equipment", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "number"
  end

  create_table "helpdesk_comments", force: true do |t|
    t.integer  "ticket_id"
    t.text     "comment"
    t.integer  "author_id"
    t.boolean  "public"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "helpdesk_faq_translations", force: true do |t|
    t.integer  "helpdesk_faq_id", null: false
    t.string   "locale",          null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "title"
    t.text     "text"
  end

  add_index "helpdesk_faq_translations", ["helpdesk_faq_id"], name: "index_helpdesk_faq_translations_on_helpdesk_faq_id", using: :btree
  add_index "helpdesk_faq_translations", ["locale"], name: "index_helpdesk_faq_translations_on_locale", using: :btree

  create_table "helpdesk_faqs", force: true do |t|
    t.integer  "position"
    t.boolean  "active",     default: false, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "helpdesk_subscribers", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "lang"
    t.string   "hashcode"
    t.boolean  "confirmed",  default: false, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "helpdesk_ticket_type_translations", force: true do |t|
    t.integer  "helpdesk_ticket_type_id", null: false
    t.string   "locale",                  null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "title"
  end

  add_index "helpdesk_ticket_type_translations", ["helpdesk_ticket_type_id"], name: "index_554cec9438d399db021564d4a79520a28d0749cc", using: :btree
  add_index "helpdesk_ticket_type_translations", ["locale"], name: "index_helpdesk_ticket_type_translations_on_locale", using: :btree

  create_table "helpdesk_ticket_types", force: true do |t|
    t.integer  "position"
    t.boolean  "active",     default: true, null: false
    t.string   "tr_class"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "helpdesk_tickets", force: true do |t|
    t.string   "subject"
    t.text     "description"
    t.integer  "requester_id"
    t.integer  "assignee_id"
    t.string   "status"
    t.integer  "ticket_type_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "mailboxer_conversation_opt_outs", force: true do |t|
    t.integer "unsubscriber_id"
    t.string  "unsubscriber_type"
    t.integer "conversation_id"
  end

  add_index "mailboxer_conversation_opt_outs", ["conversation_id"], name: "index_mailboxer_conversation_opt_outs_on_conversation_id", using: :btree
  add_index "mailboxer_conversation_opt_outs", ["unsubscriber_id", "unsubscriber_type"], name: "index_mailboxer_conversation_opt_outs_on_unsubscriber_id_type", using: :btree

  create_table "mailboxer_conversations", force: true do |t|
    t.string   "subject",    default: ""
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "mailboxer_notifications", force: true do |t|
    t.string   "type"
    t.text     "body"
    t.string   "subject",              default: ""
    t.integer  "sender_id"
    t.string   "sender_type"
    t.integer  "conversation_id"
    t.boolean  "draft",                default: false
    t.string   "notification_code"
    t.integer  "notified_object_id"
    t.string   "notified_object_type"
    t.string   "attachment"
    t.datetime "updated_at",                           null: false
    t.datetime "created_at",                           null: false
    t.boolean  "global",               default: false
    t.datetime "expires"
  end

  add_index "mailboxer_notifications", ["conversation_id"], name: "index_mailboxer_notifications_on_conversation_id", using: :btree
  add_index "mailboxer_notifications", ["notified_object_id", "notified_object_type"], name: "index_mailboxer_notifications_on_notified_object_id_and_type", using: :btree
  add_index "mailboxer_notifications", ["sender_id", "sender_type"], name: "index_mailboxer_notifications_on_sender_id_and_sender_type", using: :btree
  add_index "mailboxer_notifications", ["type"], name: "index_mailboxer_notifications_on_type", using: :btree

  create_table "mailboxer_receipts", force: true do |t|
    t.integer  "receiver_id"
    t.string   "receiver_type"
    t.integer  "notification_id",                            null: false
    t.boolean  "is_read",                    default: false
    t.boolean  "trashed",                    default: false
    t.boolean  "deleted",                    default: false
    t.string   "mailbox_type",    limit: 25
    t.datetime "created_at",                                 null: false
    t.datetime "updated_at",                                 null: false
  end

  add_index "mailboxer_receipts", ["notification_id"], name: "index_mailboxer_receipts_on_notification_id", using: :btree
  add_index "mailboxer_receipts", ["receiver_id", "receiver_type"], name: "index_mailboxer_receipts_on_receiver_id_and_receiver_type", using: :btree

  create_table "misc_work_orders", force: true do |t|
    t.integer  "account_number"
    t.string   "cost_unit"
    t.string   "cost_center"
    t.text     "cost_description"
    t.datetime "start_date"
    t.datetime "due_date"
    t.text     "description"
    t.integer  "urgency"
    t.boolean  "completion_switch"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "department_id"
  end

  create_table "misc_work_orders_users", id: false, force: true do |t|
    t.integer "misc_work_order_id"
    t.integer "user_id"
  end

  create_table "parts", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "plantasks", force: true do |t|
    t.string   "area"
    t.string   "equipment"
    t.string   "part"
    t.text     "description"
    t.text     "date"
    t.string   "data_type"
    t.integer  "upper"
    t.integer  "lower"
    t.string   "current_status"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "associate"
    t.boolean  "assigned_switch"
    t.integer  "ext_upper"
    t.integer  "ext_lower"
    t.integer  "est_time"
    t.datetime "next_occurrence"
    t.string   "procedure"
    t.integer  "target"
    t.text     "ext_description"
    t.boolean  "overdue"
    t.integer  "equip_number"
    t.text     "most_recent_comment"
    t.integer  "overdue_count"
    t.integer  "department_id"
    t.integer  "egg_timer_id"
    t.integer  "equipment_id"
  end

  create_table "procedures", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "records", force: true do |t|
    t.string   "status"
    t.decimal  "data"
    t.integer  "plantask_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "comments"
  end

  create_table "roles", force: true do |t|
    t.string   "name"
    t.integer  "resource_id"
    t.string   "resource_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "roles", ["name", "resource_type", "resource_id"], name: "index_roles_on_name_and_resource_type_and_resource_id", using: :btree
  add_index "roles", ["name"], name: "index_roles_on_name", using: :btree

  create_table "task_histories", force: true do |t|
    t.integer  "task_count"
    t.integer  "overdue_count"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "locale"
    t.string   "phone_number"
    t.string   "theme"
    t.boolean  "alert"
    t.integer  "department_id"
    t.boolean  "active_account"
  end

  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "users_roles", id: false, force: true do |t|
    t.integer "user_id"
    t.integer "role_id"
  end

  add_index "users_roles", ["user_id", "role_id"], name: "index_users_roles_on_user_id_and_role_id", using: :btree

  create_table "users_work_orders", id: false, force: true do |t|
    t.integer "work_order_id"
    t.integer "user_id"
  end

  create_table "work_orders", force: true do |t|
    t.integer  "plantask_id"
    t.integer  "urgency"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "completion_switch"
    t.datetime "due_date"
    t.datetime "start_date"
    t.integer  "department_id",     default: 1
  end

  add_foreign_key "mailboxer_conversation_opt_outs", "mailboxer_conversations", name: "mb_opt_outs_on_conversations_id", column: "conversation_id"

  add_foreign_key "mailboxer_notifications", "mailboxer_conversations", name: "notifications_on_conversation_id", column: "conversation_id"

  add_foreign_key "mailboxer_receipts", "mailboxer_notifications", name: "receipts_on_notification_id", column: "notification_id"

end
