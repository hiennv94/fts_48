class Question < ActiveRecord::Base
  enum status: [:waitting, :accept]
  enum question_type: [:single, :multiple, :text]
  belongs_to :subject
  belongs_to :user

  has_many :answers, dependent: :destroy
  has_many :results, dependent: :destroy
  has_many :exams, through: :results

  accepts_nested_attributes_for :answers, allow_destroy: true,
    reject_if: proc {|answer| answer[:content].blank?}

  validates :content, presence: true
  validates :answers, presence: true

end
