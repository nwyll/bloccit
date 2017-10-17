class FavoriteMailer < ApplicationMailer
  default from: "nataliewyll@yahoo.com"
  
  def new_comment(user, post, comment)
    headers["Message-ID"] = "<comments/#{comment.id}@secure-scrubland-90905>"
    headers["In-Reply-To"] = "<post/#{post.id}@secure-scrubland-9090>"
    headers["References"] = "<post/#{post.id}@secure-scrubland-9090>"
    
    @user = user
    @post = post
    @comment = comment
    
    mail(to:user.email, subject: "New comment on #{post.title}")
  end
  
  def new_post(post)
    headers["Message-ID"] = "<posts/#{post.id}@secure-scrubland-9090>"
    headers["In-Reply-To"] = "<post/#{post.id}@secure-scrubland-9090>"
    headers["References"] = "<post/#{post.id}@secure-scrubland-9090>"
    
    @post = post
    
    mail(to:post.user.email, subject: "You are following #{post.title}.")
  end
end
