class GetMetrics
  include Sidekiq::Worker
  sidekiq_options :queue => :analytick, :retry => false, :backtrace => true
  def perform(chart_id, start_time, end_time)
  end
end
