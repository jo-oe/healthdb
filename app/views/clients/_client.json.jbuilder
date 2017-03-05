json.extract! client, :id, :lastname, :firstname, :birthdate, :sex_id, :homeplace_id, :citizenship_id, :legalstatus_id, :familystatus_id, :childrencount, :datefirstcontact, :referrer_id, :referrerfreetext, :created_at, :updated_at
json.url client_url(client, format: :json)
