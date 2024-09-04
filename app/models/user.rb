class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  enum status: {
    active: 'active',
    inactive: 'inactive',
    archived: 'archived'
  }
  has_many_attached :images

  validates :name, presence: true, length: { minimum: 2 },
            format: { with: /[a-zA-Z]+/, message: 'Only letters allowed' }
  validates :age, numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 80 }
  validates :date_of_birth, comparison: { less_than_or_equal_to: Date.today }
  before_create  :set_account_number

  private 

  def set_account_number
    # debugger
    self.account_number = rand.to_s[2..6].to_i
  end
end
