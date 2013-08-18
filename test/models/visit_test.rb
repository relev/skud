require 'test_helper'

class VisitTest < ActiveSupport::TestCase
  def create_visit(duration)
    visit = Visit.new
    visit.created_at = Time.at(Time.now.to_i - duration*60)
    visit
  end

  test "плата за 10 минут = 15р" do
    visit = create_visit(10)
    assert visit.to_state[:price] == 15
  end

  test "плата за 61 минуту = 91р" do
    visit = create_visit(61)
    assert visit.to_state[:price] == 91
  end

  test "плата за 119 минуту = #{90+59}р" do
    visit = create_visit(119)
    assert visit.to_state[:price] == 90+59
  end

  test "плата за 120 минуту = #{90+60-20}р" do
    visit = create_visit(120)
    assert visit.to_state[:price] == 90+60-20
  end
end
