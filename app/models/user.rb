class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  #has_many :items

    validates :name,                presence: true
    validates :password,            presence: true, format: {with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i}
    validates :first_name,          presence: true, format: {with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/ }
    validates :last_name,           presence: true, format: {with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/ }
    validates :first_name_furigana, presence: true, format: {with: /\A[ァ-ヶー－]+\z/ }
    validates :last_name_furigana,  presence: true, format: {with: /\A[ァ-ヶー－]+\z/ }
    validates :date_of_birth,       presence: true

end
