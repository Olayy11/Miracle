require 'report_builder'
time = Time.now.getutc
ReportBuilder.configure do |config|
  config.json_path = './report/file_path.json'
  config.report_path = './report/cucumber_web_report'
  config.report_types = [:html]
  config.report_tabs = %w[Overview Features Scenarios Errors]
  config.report_title = 'Cucumber web automation test results'
  config.compress_images = false
  config.additional_info = { 'Project name' => 'Staging.outeast', 'Report generated' => time, Browser: 'Chrome' }
end
ReportBuilder.build_report