class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :account_histories, as: :accountable
  enum status: {
    active: 'active',
    inactive: 'inactive',
    archived: 'archived'
  }
  has_one_attached :image

  validates :pin_number, length: { is: 4 }, if: -> { pin_number.present? }
  validates :name, presence: true, length: { minimum: 2 },
            format: { with: /[a-zA-Z]+/, message: 'Only letters allowed' }
  validates :age, numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 80 }
  validates :date_of_birth, comparison: { less_than_or_equal_to: Date.today }
  before_create  :set_account_number
  before_create :set_balance

  private 

  def set_account_number
    # debugger
    self.account_number = rand.to_s[2..6].to_i
  end

  def set_balance
    self.balance = 0
  end
end
