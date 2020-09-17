class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items
  has_many :orders
  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  USER_NAME_REGEX = /\A[ぁ-んァ-ン一-龥]+\z/.freeze
  USER_KANA_NAME_REGEX = /\A[ァ-ヶー－]+\z/.freeze

  with_options presence: true do
    validates :nickname, uniqueness: { case_sensitive: true }
    validates :birth_day
  end

  validates :password, format: { with: PASSWORD_REGEX, message: 'には英字と数字の両方を含めて設定してください' }

  with_options presence: true, format: { with: USER_NAME_REGEX, message: 'には全角文字を設定してください' } do
    validates :family_name
    validates :first_name
  end

  with_options presence: true, format: { with: USER_KANA_NAME_REGEX, message: 'には全角カナを設定してください' } do
    validates :family_name_kana
    validates :first_name_kana
  end
end
