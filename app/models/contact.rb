class Contact < ApplicationRecord
  belongs_to :client
  belongs_to :counsellor, class_name: "User", foreign_key: "counsellor_id"
  belongs_to :contactreason
  belongs_to :insurancestatus
  belongs_to :counselledperson, class_name: "Counselledpersons"
  belongs_to :translatorused
  belongs_to :insuranceproblem, required: false
  belongs_to :healthproblem, required: false
  belongs_to :referral
  belongs_to :referralcaritas, required: false
  belongs_to :referraldiakonie, required: false
  belongs_to :referralothercounselling, required: false
  belongs_to :referralmedical, required: false
  belongs_to :referralauthority, required: false
  belongs_to :successfulinsurance
  belongs_to :failedinsurance

  validates_associated :client
  validates_associated :counsellor
  validates_associated :contactreason
  validates_associated :insurancestatus
  validates_associated :counselledperson
  validates_associated :translatorused
  validates_associated :referral
  validates_associated :successfulinsurance
  validates_associated :failedinsurance

  validate :validateContactdate

  def validateContactdate()
    if contactdate < client.datefirstcontact
        errors.add(:contactdate, "liegt vor Erstkontakt (Stammdatensatz)")
    end
  end
end
