class TitleValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    unless value =~ /(Won't Believe|Secret|Top \d+|Guess)/
      record.errors.add attribute, (options[:message] || "title not clickbait-y enough")
    end
  end
end

class Post < ApplicationRecord
  validates :title, presence: true, title: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w(Fiction Non-Fiction) }
  
end
