require 'random_data'

50.times do
    Post.create!(
      title: RandomData.random_sentence,
      body: RandomData.random_paragraph
    )
end

posts = Post.all

100.times do
  Comment.create!(
    post: posts.sample,
    body: RandomData.random_paragraph
  )
end

puts "#{Post.count}"
uniq_post = Post.find_or_create_by!(
  title: RandomData.random_sentence,
  body: RandomData.random_paragraph
)
puts "#{Post.count}"


puts "#{Comment.count}"
uniq_post.comments.find_or_create_by!(
  body: RandomData.random_paragraph
)
puts "#{Comment.count}"

puts "Seeds finished"
puts "#{Post.count} posts created"
puts "#{Comment.count} comments created"
