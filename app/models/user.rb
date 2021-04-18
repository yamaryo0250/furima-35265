class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # validates :nickname, presence: true
  # validates :last_name, presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/ }
  # validates :first_name, presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/ }
  # validates :last_kana, presence: true, format: { with: /\A[ァ-ヶー]+\z/ }
  # validates :first_kana, presence: true, format: { with: /\A[ァ-ヶー]+\z/ }
  # validates :birthday, presence: true
  # PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze
  # validates_format_of :password, with: PASSWORD_REGEX

  with_options presence: true do
    with_options format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/ } do
      validates :last_name
      validates :first_name
    end
    with_options format: { with: /\A[ァ-ヶー]+\z/ } do
      validates :last_kana
      validates :first_kana
    end
    validates :nickname
    validates :birthday
  end
  
  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX
end
