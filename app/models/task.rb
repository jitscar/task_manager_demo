class Task < ActiveRecord::Base
  STATES = %w(new started finished)

  belongs_to :user
  mount_uploader :attachments, AttachmentUploader

  validates :name, presence: true
  validates :state, presence: true, inclusion: { in: STATES }

  include AASM

  aasm column: :state do
    state :new, initial: true
    state :started
    state :finished

    event :start do
      transitions from: :new, to: :started
    end

    event :finish do
      transitions from: [:new, :started], to: :finished
    end
  end

  def started?
    state.eql?("started")
  end

  def finished?
    state.eql?("finished")
  end
end
