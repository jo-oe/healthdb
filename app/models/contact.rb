class Contact < ApplicationRecord
  belongs_to :client
  belongs_to :counsellor, class_name: "User", foreign_key: "counsellor_id"
  belongs_to :contactreason
  belongs_to :insurancestatus
  belongs_to :counselledperson, class_name: "Counselledpersons", foreign_key: "counselledperson_id"
  belongs_to :translatorused
  belongs_to :insuranceproblem
  belongs_to :healthproblem
  belongs_to :referral
  belongs_to :referralcaritas
  belongs_to :referraldiakonie
  belongs_to :referralothercounselling
  belongs_to :referralmedical
  belongs_to :referralauthority
  belongs_to :successfulinsurance
  belongs_to :failedinsurance
end
