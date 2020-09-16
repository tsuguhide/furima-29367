class User < ApplicationRecord
  has_many :items
  has_many :orders

  #  必須項目
  with_options presence: true do
    validates :nick_name
    validates :birthday
    #  パスワードは半角英数字混合であること
    validates :password, confirmation: true, format: { with: /\A[a-z0-9]+\z/i }
    validates :password_confirmation, confirmation: true, format: { with: /\A[a-z0-9]+\z/i }
    #  ユーザー本名は全角（漢字・ひらがな・カタカナ）で入力させること
    validates :family_name, format: { with: /\A[ぁ-んァ-ン一-龥]/ }
    validates :first_name, format: { with: /\A[ぁ-んァ-ン一-龥]/ }
    #  ユーザー本名のフリガナは全角（カタカナ）で入力させること
    validates :furigana_family_name, format: { with: /\A[ァ-ヶー－]+\z/ }
    validates :furigana_first_name, format: { with: /\A[ァ-ヶー－]+\z/ }
  end

  #  下記はデバイスで対応済み
  #  パスワードは確認用を含めて2回入力すること#  パスワードは6文字以上であること

  # メールアドレスは@を含む必要があること   #  メールアドレスが一意性であること
  # validates :mail_address, uniqueness: true, inclusion: { in: "@" }

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
