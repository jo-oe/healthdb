#if(params['sf'])
#  @sf = params['sf']
#  @sq = params['sq']
#  json.client @client do |client|
#  end

#else
  json.array! @clients, partial: 'clients/client', as: :client
#end
