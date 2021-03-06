class Client < ApplicationRecord
  has_many :contacts

  belongs_to :sex
  belongs_to :homeplace
  belongs_to :citizenship
  belongs_to :legalstatus
  belongs_to :familystatus
  belongs_to :referrer

  validates :id, presence: true, length: {minimum: 8, maximum: 8}
  validates :sex, presence: true
  validates :homeplace, presence: true
  validates :birthdate, presence: true
  validates :citizenship, presence: true
  validates :legalstatus, presence: true
  validates :familystatus, presence: true
  validates :childrencount, presence: true
  validates :datefirstcontact, presence: true
  validates :referrer, presence: true
end
