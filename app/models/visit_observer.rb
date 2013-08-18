class VisitObserver < ActiveRecord::Observer
  observe :visit
  def after_save(visit)
    client = Faye::Client.new('http://clockface.headmade.pro:9292/faye')
    client.publish '/visit', visit.to_json
  end
  def after_create(visit)
    client = Faye::Client.new('http://clockface.headmade.pro:9292/faye')
    client.publish '/start', visit.to_json
  end
end
