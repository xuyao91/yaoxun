class Courier < ActiveRecord::Base
  validates :odd_num,:wx_user_id, :presence => true
  attr_accessible :wx_user_id, :odd_num
  #validate :example_valid_4_base

  def example_valid
    #errors.add(:odd_num, "can't be blank") unless self.odd_num.present?
    errors[:odd_num] =  "can't be blank too" unless self.odd_num.present?
  end  

  def example_valid_4_base
    errors[:base] << "test error message!!!"
  end  

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
