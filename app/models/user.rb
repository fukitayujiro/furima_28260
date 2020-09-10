class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: [:facebook, :google_oauth2]
  has_many :items
  has_many :user_items
  has_many :sns_credentials

  def self.from_omniauth(auth)
    sns = SnsCredential.where(provider: auth.provider, uid: auth.uid).first_or_create
    user = User.where(email: auth.info.email).first_or_initialize(
      nickname: auth.info.name,
        email: auth.info.email
    )
    if user.persisted?
      sns.user = user
      sns.save
    end
    { user: user, sns: sns }
  end

  with_options presence: true do
    validates :nickname
    validates :birth_date
  end

  with_options presence: true, uniqueness: true do
    validates :email
  end

  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i
  with_options presence: true, confirmation: true, length: { minimum: 6 },format: { with: PASSWORD_REGEX } do
    validates :password
  end

  VALID_NAME_REGEX = /\A[ぁ-んァ-ン一-龥]+\z/
  with_options presence: true, format: { with: VALID_NAME_REGEX, message: '全角文字を使用してください' } do
    validates :first_name
    validates :last_name
  end

  VALID_KANA_REGEX = /\A[ァ-ン]+\z/
  with_options presence: true, format: { with: VALID_KANA_REGEX, message: '全角カタカナ文字を使用してください' } do
    validates :first_name_kana
    validates :last_name_kana
  end
  
end
