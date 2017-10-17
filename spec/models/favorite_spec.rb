require 'rails_helper'

RSpec.describe Favorite, type: :model do
  let(:topic) { Topic.create!(name: name, description: description) }
  let(:post) { topic.posts.create!(title: title, body: body, user: user) }
  let(:user) { User.create!(name: "Bloccit User", email: "user@bloccit.com", password: "helloworld") }
  let(:favorite) { Favorite.create!(post: post, user: user) }
  
  it { is_expected.to belong_to(:post) }
  it { is_expected.to belong_to(:user) }
end
