require 'rufus-scheduler'
require 'koala'

scheduler = Rufus::Scheduler.new

# Once in a while...
scheduler.every ENV['FREQUENCY'] do

  # We connect to Facebook Graph API
  @graph = Koala::Facebook::API.new ENV['ACCESS_TOKEN']

  # We post a comment 'x' under our own post
  @comment = @graph.put_comment(ENV['POST_ID'], 'x')

  # After the comment is posted, we delete it away
  @delete_comment = @graph.delete_object @comment['id']

  # For logging purpose
  puts 'Post Bumped' if @delete_comment
end

puts 'Starting Serial Bumper'

scheduler.join
