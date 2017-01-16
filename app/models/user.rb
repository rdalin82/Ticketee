class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates_uniqueness_of :email, allow_blank: true, if: :email_changed?
  scope :excluding_archived, -> { where(archived_at: nil) }

  def to_s
    "#{email} (#{admin? ? 'Admin' : 'User'})"
  end
  def archive
    self.update(archived_at: Time.now)
  end
end
