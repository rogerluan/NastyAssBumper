require 'rufus-scheduler'
require 'koala'

scheduler = Rufus::Scheduler.new

scheduler.every '10m' do
  @graph = Koala::Facebook::API.new ENV['ACCESS_TOKEN']
  @comment = @graph.put_comment(ENV['POST_ID'], 'x')
  @delete_comment = @graph.delete_object @comment['id']
  puts 'Post Bumped' if @delete_comment
end

puts 'Starting Serial Bumper'

scheduler.join