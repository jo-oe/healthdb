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

  def self.to_csv(options = {})
    CSV.generate(options) do |csv|
      csv << {
        "Vermittlung durch Gesundheitsamt",
        "Vermittlung durch Beratungsstelle"
        "Vermittlung durch MMM"
        "Vermittlung durch Wohnheim/Flüchtlingsunterkunft"
        "Vermittlung durch Krankenhaus"
        "Vermittlung durch Arztpraxis"
        "Vermittlung durch sonstige"
      }
      all.each do |contact|
        # "Vermittlung durch Gesundheitsamt"
        if( contact.client.referrer_id == "G" )
          line << "1"
        else
          line << "0"
        end

        # "Vermittlung durch Beratungsstelle"
        if( contact.client.referrer_id == "D"  || client.referrer_id == "N")
          line << "1"
        else
          line << "0"
        end

        # "Vermittlung durch MMM"
        if( contact.client.referrer_id == "M" )
          line << "1"
        else
          line << "0"
        end

        # "Vermittlung durch Wohnheim/Flüchtlingsunterkunft"
        if( contact.client.referrer_id == "W" )
          line << "1"
        else
          line << "0"
        end

        # "Vermittlung durch Krankenhaus"
        if( contact.client.referrer_id == "K" )
          line << "1"
        else
          line << "0"
        end

        # "Vermittlung durch Arztpraxis"
        if( contact.client.referrer_id == "A" )
          line << "1"
        else
          line << "0"
        end

        # "Vermittlung durch sonstige"
        if( client.referrer_id == "U" || client.referrer_id == "S" )
          line << "1"
        else
          line << "0"
        end

        csv << line

      end
    end
  end

end
