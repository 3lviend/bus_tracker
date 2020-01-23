env :PATH, ENV['PATH']
# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron

set :output, "log/cron_log.log"

every 1.minutes do
  rake "postition:test"
end

# 23 on UTC == 7/7am in PDT, 12 on UTS == 20/8pm iin
# every '*/1 7-12 * * 1-5' do
every '*/2 7-20 * * 1-5' do
  rake "postition:get_position"
end

# Learn more: http://github.com/javan/whenever
