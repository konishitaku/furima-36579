class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  validates :nickname, presence: true
  with_options presence: true, format: { with: /\A[ぁ-ゔァ-ヴ\p{Ideographic}ａ-ｚＡ-Ｚ０-９]+\z/, message: 'Input full-width characters' } do
  validates :last_name, presence: true
  validates :first_name, presence: true
  end
  with_options presence: true, format: { with: /\A[ァ-ヴー]+\z/u, message: 'Input full-width katakana characters' } do
  validates :last_name_kana, presence: true
  validates :first_name_kana, presence: true
  end
  with_options presence: true, format: { with: /[a-z\d]{6,}/i, message: 'Include both letters and numbers' } do
  validates :password, presence: true, length: { minimum: 5 }
  end
  validates :birthday, presence: true

end
