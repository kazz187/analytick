class GetMetrics
  include Sidekiq::Worker
  sidekiq_options :queue => :analytick, :retry => false, :backtrace => true
  def perform(chart_id, start_time, end_time)
    chart = Chart.find(chart_id)
    # TODO: checkchart.database.db_type
    time = DateTime.parse(start_time)
    start_time = DateTime.parse(start_time)
    end_time = DateTime.parse(end_time)
    
    time -= time.hour.hour
    time -= time.min.minutes
    time -= time.sec.seconds
    metrics = []
    begin
      result = mongo(chart.database.db_name, chart.query, time)
      metric = Metric.new do |m|
        m.chart_id = chart_id
        m.time = time
        m.value = result
      end
      metrics << metric
      time += 1.day
    end while time <= end_time
    slice_import(metrics, {on_duplicate_key_update: [:chart_id, :time, :value]}, 100)
  end

  def mongo(db, query_template, time)
    query = create_mongo_query(query_template, time)
logger.info time 
    result = `mongo #{db} --quiet --eval '#{query}'`
    logger.info result
    result
  end
  
  def create_mongo_query(query_template, time)
    time -= time.hour.hour
    time -= time.min.minutes
    time -= time.sec.seconds

    func_list = query_template.scan /__([A-Z]+)\(([0-9]+)\)__/
    query = Marshal.load(Marshal.dump(query_template))
    func_list.uniq.each do |func|
      query.gsub!("__#{func[0]}(#{func[1]})__", "ISODate(\"#{(time + func[1].to_i.day).iso8601}\")")
    end
    query
  end

  private
  def slice_import(array, options, n)
    array.each_slice(n) do |sub_array|
      copied_options = Marshal.load(Marshal.dump(options))
      sub_array.first.class.import(sub_array, copied_options)
    end
  end
end
