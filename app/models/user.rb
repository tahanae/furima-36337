class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items

    validates :name,                presence: true
    validates :password,            presence: true, length: { minimum: 6}
    validates :email,               presence: true, format: {with: /\A\S+@\S+\.\S+\z/ }
    validates :first_name,          presence: true, format: {with: /\A[ぁ-んァ-ン一-龥]/ }
    validates :last_name,           presence: true, format: {with: /\A[ぁ-んァ-ン一-龥]/ }
    validates :first_name_furigana, presence: true, format: {with: /\A[ァ-ヶー－]+\z/ }
    validates :last_name_furigana,  presence: true, format: {with: /\A[ァ-ヶー－]+\z/ }
    validates :date_of_birth,       presence: true, format: {with: /\A\d{4}-\d{2}-\d{2}\z/ }
    
end
