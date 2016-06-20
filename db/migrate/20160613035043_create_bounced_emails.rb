class CreateBouncedEmails < ActiveRecord::Migration
  def change
    create_table :bounced_emails do |t|
      t.string :recipient_address
      t.string :recipient_host
      t.string :deliverystatus
      t.string :replycode
      t.string :reason
      t.text :diagnosticcode
      t.string :diagnostictype
      t.integer :softbounce
      t.timestamps
    end
  end
end
