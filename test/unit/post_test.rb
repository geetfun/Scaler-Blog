# == Schema Information
#
# Table name: posts
#
#  id         :integer         not null, primary key
#  text       :text
#  user_id    :integer
#  created_at :datetime
#  updated_at :datetime
#  title      :string(255)
#  status     :string(255)
#

require 'test_helper'

class PostTest < ActiveSupport::TestCase
  context "A Post instance's validations" do
    setup do
      @post = Post.new
      @valid_attributes = { 
        :title => "My first blog post", 
        :text => "Really exciting news here guys!"
        }
    end
    subject { @post }
    
    should "validate presence of title, text if state is :published" do
      @post.publish
      assert !@post.valid?
      assert @post.errors.on(:title)
      assert @post.errors.on(:text)
    end

    should "validate presence of title, text if state is :published_privately" do
      @post.publish_privately
      assert !@post.valid?
      assert @post.errors.on(:title)
      assert @post.errors.on(:text)
    end
  end
  
  context "A Post instance's state" do
    setup do
      @post = Post.new
    end
    subject { @post }
    
    should "be in unpublished state initially" do
      assert_equal @post.aasm_current_state, :unpublished
    end
    
    should "transition from :unpublished to :published" do
      @post.publish!
      assert_equal @post.aasm_current_state, :published
    end
    
    should "transition from :unpublished to :published_privately" do
      @post.publish_privately!
      assert_equal @post.aasm_current_state, :published_privately
    end
    
    context "whose state is :published" do
      setup do
        @post.publish!
      end
      
      should "be :published" do
        assert_equal @post.aasm_current_state, :published
      end
      
      should "transition from :published to :published_privately" do
        @post.publish_privately!
        assert_equal @post.aasm_current_state, :published_privately
      end

      should "transition from :published to :unpublished" do
        @post.unpublish!
        assert_equal @post.aasm_current_state, :unpublished
      end
    end
    
    context "whose state is published_privately" do
      setup do
        @post.publish_privately!
      end
      
      should "be :published_privately" do
        assert_equal @post.aasm_current_state, :published_privately
      end
      
      should "transition from :published_privately to :published" do
        @post.publish!
        assert_equal @post.aasm_current_state, :published
      end

      should "transition from :published_privately to :unpublished" do
        @post.unpublish
        assert_equal @post.aasm_current_state, :unpublished
      end
    end    
  end
end
