desc "Run all of your sneakers tasks"
task :amqp => :environment do
  CreatePolicyWorker
  Rake::Task["sneakers:run"].invoke
end