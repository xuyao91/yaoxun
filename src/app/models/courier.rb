class Courier < ActiveRecord::Base
  # attr_accessible :title, :body

  def search
    message = []
    url = "http://www.kuaidi100.com/autonumber/auto?num=#{keyword}"
    url = URI::encode(url)
    data = open(url).read
    ret = JSON.parse data
    type = ret[0]['comCode']
    query = "http://www.kuaidi100.com/query?type=#{type}&postid=#{keyword}&id=1&valicode=&temp=0.9590612647589296"
    query = URI::encode(query)
    content = open(query).read
    json = JSON content
    result = json['data']
    result.each do |r|
      message << [r['time'],r['context']]
    end
    return message
  end

end
