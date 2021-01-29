# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

def random_user_id(used_ids)
  ids = User.all.ids
  while true
    id_picked = ids.sample
    return id_picked unless Array(used_ids).include?(id_picked)
  end
end

10.times.each do |times|
  User.create name: "User #{times + 1}"
end

User.all.each do |user|
  10.times.each do |times|
    user.sleeps.create start_time: times.day.ago.to_time, end_time: times.day.ago.to_time + 8.hour
  end

  5.times.each do |_|
    user.user_followers.create follower_id: random_user_id([user.id] + user.followers.ids)
  end
end
