namespace :digest do
  desc "Sends daily digest of yesterday to all editorial users"
  task :daily => :environment do
    time = Time.new.yesterday
    time_range = time.beginning_of_day..time.end_of_day
    activities =  Activity.where(created_at: time_range)
    User.where(role: 'editorial').pluck(:id).each do |u|
      EventDigest.daily(u, activities.pluck(:id)).deliver
    end
  end
end
