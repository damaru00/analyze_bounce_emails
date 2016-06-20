class BouncedEmail < ActiveRecord::Base
  # attr_accessible :title, :body
  attr_accessible :recipient_address, :recipient_host, :deliverystatus, :replycode, :reason, :diagnosticcode, :diagnostictype, :softbounce
  def self.fetch_bounced
    v = Sisimai.make('/mnt/mir/Backup/GmailBackup/maildir/new')

    if v
      v.each do |e|
        if BouncedEmail.where(recipient_address:e.recipient.address).count < 1
          BouncedEmail.create recipient_address: e.recipient.address, recipient_host: e.recipient.host, deliverystatus: e.deliverystatus, replycode: e.replycode, reason: e.reason, diagnosticcode: e.diagnosticcode, diagnostictype: e.diagnostictype, softbounce: e.softbounce
        end
      end
    end

    maildir = Maildir.new("/mnt/mir/Backup/GmailBackup/maildir/")
    mails = maildir.list(:new)

    if mails
      mails.each do |m|
        m.process
      end
    end

  end

end
