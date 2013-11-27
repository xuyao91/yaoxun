

namespace :dev do

  desc "========== create defalut wx_user ============"
  task :wx_user => :environment do
    attrs = {
      :uid => '10000',
      :tel => '13052359606',
      :address => '上海市浦东新区浦东软件园郭守敬路498号'
    }
    wx_user = WxUser.wehere(attrs).first_or_create
  end

end