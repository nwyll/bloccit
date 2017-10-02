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


uniq_post = Post.find_or_create_by!(
  title: "UNique Post Title",
  body: "UNique post body"
)

uniq_post.comments.find_or_create_by!(
  body: "UNique comment body"
)

puts "Seeds finished"
puts "#{Post.count} posts created"
puts "#{Comment.count} comments created"
